#coding: utf-8

class Redditor::Admin::VideoBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.video_blocks.build(content_block_params)
    render "redditor/new"
  end

  def update
    @content_block = @page.video_blocks.find(params[:id])
    @content_block.update_attributes(content_block_params)
    render "redditor/wrapper"
  end

  def create
    @content_block = @page.video_blocks.build(content_block_params)
    @content_block.save
    render "redditor/wrapper"
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