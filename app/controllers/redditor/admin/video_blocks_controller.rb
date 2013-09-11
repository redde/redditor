#coding: utf-8

class Redditor::Admin::VideoBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.video_blocks.build(params[:content_block])
    render "redditor/admin/pages/new"
  end

  def update
    @content_block = @page.video_blocks.find(params[:id])
    @content_block.update_attributes(params[:content_block])
    render "redditor/admin/pages/wrapper"
  end

  def create
    @content_block = @page.video_blocks.build(params[:content_block])
    @content_block.save
    render "redditor/admin/pages/wrapper"
  end

  def destroy
    @content_block = @page.video_blocks.find(params[:id])
    if @content_block.destroy
      render :js => "$('#video_block_#{@content_block.id}').closest('dd').remove();"
    else
      render :js => "alert('Контент-блок не удален');"
    end
  end

end