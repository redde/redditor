# coding: utf-8

class Redditor::Admin::ImagesController < Redditor::Admin::BaseController

  layout false

  def sort
    params[:slider_block_image].each_with_index do |id, idx|
      p = Redditor::Image.find(id)
      p.position = idx
      p.save
    end
    render :nothing => true
  end

  def create
    @slider_block = @page.slider_blocks.find(params[:slider_block_id])
    @image = @slider_block.images.build(src: params[:file])
    if @image.save
      render "redditor/admin/slider_block_image"
    end
  end

  def destroy
    @image = Redditor::Image.find(params[:id])
    if @image.destroy
      render :js => "$('#slider_block_image_#{@image.id}').remove()"
    else
      render :js => 'Ошибка! Изображение не было удалено.'
    end
  end

end