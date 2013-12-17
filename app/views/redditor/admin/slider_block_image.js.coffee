$("#slider_block_<%= @slider_block.id %>").find("ul.slider-block-images")
.append '<%= j(render "redditor/admin/slider_block_image", {i: @image}) %>'