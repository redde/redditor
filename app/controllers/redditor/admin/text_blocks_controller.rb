#coding: utf-8

class Redditor::Admin::TextBlocksController < Redditor::Admin::BaseController

  def new
    @content_block = @page.text_blocks.build(text_block_params)
    render "redditor/admin/pages/new"
  end

  def update
    @content_block = @page.text_blocks.find(params[:id])
    @content_block.update_attributes(text_block_params)
    render "redditor/admin/pages/wrapper"
  end

  def create
    @content_block = @page.text_blocks.build(text_block_params)
    @content_block.save
    render "redditor/admin/pages/wrapper"
  end

  def destroy
    @content_block = @page.text_blocks.find(params[:id])
    if @content_block.destroy
      render :js => "$('#text_block_#{@content_block.id}').closest('dd').remove();"
    else
      render :js => "alert('Контент-блок не удален');"
    end
  end

  private

    def text_block_params
      params.require(:content_block).permit!
    end

end