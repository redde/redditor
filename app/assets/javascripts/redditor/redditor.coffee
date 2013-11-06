#= require fileapi
#= require fileapi/uploader

window.REDDE = {redditor: {}}
REDDE.redditor.sliderBlockImagesSortableParams =
  scroll: false
  dropOnEmpty: false
  cursor: "crosshair"
  opacity: 0.75
  items: "li"
  update: ->
    self = $(@)
    $.ajax
      data: self.sortable('serialize') + '&authenticity_token=#{u(form_authenticity_token)}'
      dataType: 'script'
      url: self.data("sortable-url")
    .done ->
      # console.log 
      return
    .error ->
      alert "Ошибка, данные не сохранены"

REDDE.redditor.parameterizationForm = (box) ->
  form = box.serializeForm()
  formName = box.find("div.form-name").data("object-name")
  firstProperty = formName.replace(/^(.*?)\[.*/,"$1")
  nextProperties = formName.match(/\[(.*?)\]/g)
  nextProperties = $.map nextProperties, (n)->
    n.replace(/\[(.*)\]/,"$1")
  params = form[firstProperty]
  for i in nextProperties
    params = params[i]
  params = "content_block": params


REDDE.redditor.setPositions = ->
  $el = REDDE.redditor.$el
  $el.find($el.sortable("option", "items")).each (i) ->
    $(this).find("input.js-position").val i # временное решение с input type=number

REDDE.redditor.sortList = ->
  sortArray = $.map REDDE.redditor.$el.find("dd"), (n) ->
    key = $(n).attr("class")
    input = $(n).find("input[type=hidden][name='#{$(n).find("div.form-name").data("object-name")}[id]']")
    value = input.val()
    # console.log input, value
    if value?
      obj = {}
      obj[key] =
        index: value
        position: $(n).index()      
      obj
    else
      null

  # console.log sortArray

  if sortArray.length
    $.ajax
      type: "post"
      # data: self.sortable('serialize') + '&authenticity_token=<%= u(form_authenticity_token) %>',
      data: {sort: sortArray}
      dataType: "script"
      url: REDDE.redditor.$el.data("sort-url")
    .done(REDDE.redditor.setPositions)
  else
    REDDE.redditor.setPositions()

$ ->
  REDDE.redditor.$el = $("dl.redditor").first()

  $(".add_fields").click ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data("id"), "g")
    self = REDDE.redditor.$el.append($(this).data("fields").replace(regexp, time))
    REDDE.redditor.setPositions()

  REDDE.redditor.$el.sortable
    dropOnEmpty: false
    cursor: "crosshair"
    opacity: 0.75
    handle: ".handle"
    axis: "y"
    items: "dd"
    scroll: false
    update: REDDE.redditor.sortList
    start: ->
      # необходимо обновить, чтобы сортировака работала корректно, тк меняем высоту блоков
      $(@).addClass("now-sortable").sortable( "refresh" )
      return
    stop: ->
      $(@).removeClass("now-sortable")
      return

  .on "ajax:beforeSend", "a.update-data", (event, xhr, status) ->
    box = $(@).closest "dd"
    params = REDDE.redditor.parameterizationForm(box)
    status.url += "?" + $.param(params)

  $("ul.slider-block-images").sortable REDDE.redditor.sliderBlockImagesSortableParams

  $('div.redditor-add-blocks').on "ajax:beforeSend", "a.new-block", (event, xhr, status) ->
    status.url += "?" + $.param(content_block: {temp_id: new Date().getTime()}) # generate uniq id

#! jquery-serializeForm - Make an object out of form elements - v1.1.1 - 2013-01-21
#* https://github.com/danheberden/jquery-serializeForm
#* Copyright (c) 2013 Dan Heberden; Licensed MIT 
(($) ->
  $.fn.serializeForm = ->
    
    # don't do anything if we didn't get any elements
    return false  if @length < 1
    data = {}
    lookup = data #current reference of data
    selector = ":input[type!=\"checkbox\"][type!=\"radio\"], input:checked"
    parse = ->
      
      # data[a][b] becomes [ data, a, b ]
      named = @name.replace(/\[([^\]]+)?\]/g, ",$1").split(",")
      cap = named.length - 1
      $el = $(this)
      
      # Ensure that only elements with valid `name` properties will be serialized
      if named[0]
        i = 0

        while i < cap
          
          # move down the tree - create objects or array if necessary
          lookup = lookup[named[i]] = lookup[named[i]] or ((if named[i + 1] is "" then [] else {}))
          i++
        
        # at the end, push or assign the value
        if lookup.length isnt `undefined`
          lookup.push $el.val()
        else
          lookup[named[cap]] = $el.val()
        
        # assign the reference back to root
        lookup = data

    
    # first, check for elements passed into this function
    @filter(selector).each parse
    
    # then parse possible child elements
    @find(selector).each parse
    
    # return data
    data
) jQuery