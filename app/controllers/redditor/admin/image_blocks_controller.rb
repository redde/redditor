# coding: utf-8

class Redditor::Admin::ImageBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.images.build(params[:content_block])
    render "redditor/admin/pages/new"
  end

  def update
    @content_block = @page.images.find(params[:id])
    @content_block.update_attributes(params[:content_block])
    render "redditor/admin/pages/wrapper"
  end

  def create
    @content_block = @page.images.build(params[:content_block])
    @content_block.update_attributes(src: params[:file])
    render "redditor/admin/pages/wrapper"
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
    render "redditor/admin/pages/wrapper"
  end

end