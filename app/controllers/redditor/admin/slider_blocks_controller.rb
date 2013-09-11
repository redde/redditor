# coding: utf-8

class Redditor::Admin::SliderBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.slider_blocks.build(params[:content_block])
    render "redditor/admin/pages/new"
  end

  def update
    @content_block = @page.slider_blocks.find(params[:id])
    @content_block.update_attributes(params[:content_block])
    render "redditor/admin/pages/wrapper"
  end

  def create
    temp_last_postion = @page.try(:content_blocks).try(:last).try(:position).to_i + 1
    @content_block = @page.slider_blocks.build(params[:content_block])
    @content_block.update_attributes(position: temp_last_postion)
    render "redditor/admin/pages/new"
  end

  def destroy
    @content_block = @page.slider_blocks.find(params[:id])
    if @content_block.destroy
      render :js => "$('#slider_block_#{@content_block.id}').closest('dd').remove();"
    else
      render :js => "alert('Контент-блок не удален');"
    end
  end

end