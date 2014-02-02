$("#<%= real_name(@content_block) %>_<%= @content_block.object_id %>, #<%= real_name(@content_block) %>_<%= @content_block.id %>").closest("dd")
.html('<%= j(render("redditor/admin/wrapper", {content_block: @content_block, page: @page})) %>').find("ul.slider-block-images").sortable $.redditor.sliderBlockImagesSortableParams
$.redditor.afterFunc()