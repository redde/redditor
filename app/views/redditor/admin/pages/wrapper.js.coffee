$("#<%= @content_block.class.name.underscore %>_<%= @content_block.temp_id %>, #<%= @content_block.class.name.underscore %>_<%= @content_block.id %>").closest("dd")
.html('<%= j(render(partial: "redditor/admin/pages/wrapper", locals: {content_block: @content_block, page: @page})) %>')
.find("textarea:visible:not(.nowred)").redactor(reddactorSettings)
.end()
.find("ul.slider-block-images").sortable REDDE.redditor.sliderBlockImagesSortableParams
selectLang(location.hash.replace("#",""))