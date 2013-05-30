# coding: utf-8

class Admin::Redditor::RedditorController < Admin::BaseController
  layout false

  before_filter :get_page

  def get_page
    @page = Page.find(params[:page_id])
  end

end