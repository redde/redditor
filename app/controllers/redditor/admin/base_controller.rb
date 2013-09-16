# coding: utf-8

class Redditor::Admin::BaseController < ActionController::Base
  layout false

  before_filter :get_page

  private

    def get_page
      @page = Redditor::Page.find(params[:page_id] || params[:id])
    end

    def content_block_params
      params.require(:content_block).permit!
    end

end