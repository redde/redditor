window.FU =
  config:
    maxFileSizeMB: 10
    messages:
      error: "Ошибка"
      done: "Загружено"
    data: ->
  icon:
    image: "//cdn1.iconfinder.com/data/icons/humano2/32x32/apps/synfig_icon.png"

  files: []
  index: 0
  active: false

  add: (file) ->
    FU.files.push file
    if /^image/.test(file.type)
      FileAPI.Image(file).preview(35).rotate("auto").get (err, img) ->
        FU._getEl(file, ".js-left").addClass("b-file__left_border").html img  unless err

  getFileById: (id) ->
    i = FU.files.length
    return FU.files[i]  if FileAPI.uid(FU.files[i]) is id  while i--

  start: ->
    FU._upload FU.files[FU.index]  if not FU.active and (FU.active = FU.files.length > FU.index)

  abort: (id) ->
    file = @getFileById(id)
    file.xhr.abort()  if file.xhr

  _getEl: (file, sel) ->
    $el = $("#file-" + FileAPI.uid(file))
    (if sel then $el.find(sel) else $el)

  _upload: (file) ->
    if file
      FileAPI.upload(
        url: FU.config.uploadUrl+"?authenticity_token=#{encodeURIComponent($("meta[name=\"csrf-token\"]").attr("content"))}"
        data: FU.config.data()
        dataType: "script"

        files:
          file: file

        upload: ->
          FU._getEl(file).addClass "b-file_upload"
          FU._getEl(file, ".js-progress").css(opacity: 0).show().animate
            opacity: 1
          , 100

        progress: (evt) ->
          FU._getEl(file, ".js-bar").css "width", evt.loaded / evt.total * 100 + "%"

        complete: (err, xhr) ->
          setTimeout(xhr.responseText, 10)

          state = (if err then "error" else "done")
          FU._getEl(file).removeClass "b-file_upload"
          FU._getEl(file, ".js-progress").animate
            opacity: 0
          , 200, ->
            $(@).hide().closest("div.js-file").delay(1000).fadeOut 200, ->
              $(@).remove()

          FU._getEl(file, ".js-info").append ", <b class=\"b-file__" + state + "\">" + ((if err then (xhr.statusText or err) else FU.config.messages[state])) + "</b>"
          FU.index++
          FU.active = false
          FU.start()
      )

  template: '<div id="file-<%=FileAPI.uid(file)%>" class="js-file b-file b-file_<%=file.type.split("/")[0]%>">
              <div class="js-left b-file__left">
                <img src="<%=icon[file.type.split("/")[0]]||icon.def%>" width="32" height="32" style="margin: 2px 0 0 3px"/>
              </div>
              <div class="b-file__right">
                <div class="js-name b-file__name"><%=file.name%></div>
                <div class="js-info b-file__info">Размер: <%=(file.size/FileAPI.KB).toFixed(2)%> KB</div>
                <div class="js-progress b-file__bar" style="display: none">
                  <div class="b-progress"><div class="js-bar b-progress__bar"></div></div>
                </div>
              </div>
              <i class="js-abort b-file__abort" title="abort">&times;</i>
            </div>'


window.onFiles = (files, context) ->
  $context = $(context)
  if uploadUrl = $context.data("upload-url")
    FU.config.uploadUrl = uploadUrl

  if contentBlockId = $context.data("content-block-id")
    FU.config.data = ->
      REDDE.redditor.parameterizationForm $context.closest("dd")
  else
    FU.config.data = ->
  
  FileAPI.each files, (file) ->
    if file.size >= FU.config.maxFileSizeMB * FileAPI.MB
      alert "Sorrow.\nMax size #{FU.config.maxFileSizeMB}MB"
    else if file.size is undefined
      $("#oooops").show()
      $("#buttons-panel").hide()
    else
      $("#preview").append tmpl(window.FU.template,
        file: file
        icon: FU.icon
      )
      FU.add file
      FU.start()

$ ->
  unless FileAPI.support.cors or FileAPI.support.flash
    $("<div />",
      class: "alert"
      html: "Увы, ваш браузер не поддерживает html5 и flash, поэтому смотреть тут нечего, а iframe не даёт всей красоты :]"
    ).insertAfter "#page-header" # если загрузка не поддерживается, то выводим сообщение
    $('#buttons-panel').hide()

  # закоментил, пока пересекается с fileapi
  # if FileAPI.support.dnd
  #   $('#drag-n-drop').show() #выводим текст с сообщение что работает dnd
  #   $(document).dnd (over) ->
  #     $('#drop-zone').toggleClass "active", over #Если кто-то перетащил файлы в браузер подсвечиваем область в которую их можно бросить
  #     return
  #   , ->
  #   $('#drop-zone').dnd (over) ->
  #     return
  #   , (files) ->
  #     onFiles files, this
  #     return

  $('.redditor').on 'change', 'input.redditor__js-fileapi[type="file"]', (evt) ->
    files = FileAPI.getFiles(evt)
    onFiles(files, this)
    FileAPI.reset(evt.currentTarget)
    return

  return