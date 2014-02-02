# coding: utf-8

class Redditor::Admin::SliderBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.slider_blocks.build(content_block_params)
    render "redditor/admin/new"
  end

  def change_view
    @content_block = @page.slider_blocks.find(params[:id])
    # оставляем только :kind и :object_id параметры, чтобы при возвращении к старому виду описания к фотографиям не сохранялись
    @content_block.update_attributes(params.require(:content_block).permit(:kind, :object_id))
    render "redditor/admin/wrapper"
  end

  def update
    @content_block = @page.slider_blocks.find(params[:id])
    @content_block.update_attributes(content_block_params)
    render "redditor/admin/wrapper"
  end

  def create
    temp_last_postion = @page.try(:content_blocks).try(:last).try(:position).to_i + 1
    @content_block = @page.slider_blocks.build(content_block_params)
    @content_block.update_attributes(position: temp_last_postion)
    render "redditor/admin/new"
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