# coding: utf-8

class Redditor::Admin::BaseController < ActionController::Base
  layout false

  before_filter :get_page

  def get_page
    @page = Redditor::Page.find(params[:page_id])
  end

end