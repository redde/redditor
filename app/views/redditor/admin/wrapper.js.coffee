$("#<%= real_name(@content_block) %>_<%= @content_block.temp_id %>, #<%= real_name(@content_block) %>_<%= @content_block.id %>").closest("dd")
.replaceWith('<%= j(render(partial: "redditor/admin/wrapper", locals: {content_block: @content_block, page: @page})) %>')
.end()
.find("ul.slider-block-images").sortable $.redditor.sliderBlockImagesSortableParams
$.redditor.afterFunc()