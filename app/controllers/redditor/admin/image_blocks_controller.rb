# coding: utf-8

class Redditor::Admin::ImageBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.images.build(content_block_params)
    render "redditor/admin/new"
  end

  def update
    @content_block = @page.images.find(params[:id])
    @content_block.update_attributes(content_block_params)
    render "redditor/admin/wrapper"
  end

  def create
    @content_block = @page.images.build(content_block_params)
    @content_block.update_attributes(src: params[:file])
    render "redditor/admin/wrapper"
  end

  def destroy
    @content_block = @page.images.find(params[:id])
    if @content_block.destroy
      render :js => "$('#image_#{@content_block.id}').closest('dd').remove();"
    else
      render :js => "alert('Контент-блок не удален');"
    end
  end

  def update_post
    @content_block = @page.images.find(params[:id])
    @content_block.update_attributes(src: params[:file])
    render "redditor/admin/wrapper"
  end

end