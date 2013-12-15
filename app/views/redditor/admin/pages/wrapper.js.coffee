$("#<%= real_name(@content_block) %>_<%= @content_block.temp_id %>, #<%= real_name(@content_block) %>_<%= @content_block.id %>").closest("dd")
.replaceWith('<%= j(render(partial: "redditor/admin/pages/wrapper", locals: {content_block: @content_block, page: @page})) %>')
# .find("textarea:visible:not(.nowred)").redactor(reddactorSettings)
.end()
.find("ul.slider-block-images").sortable $.redditor.sliderBlockImagesSortableParams