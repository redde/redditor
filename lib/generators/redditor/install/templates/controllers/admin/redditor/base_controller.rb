# coding: utf-8

require 'admin/base_controller'
class Admin::Redditor::BaseController < Admin::BaseController
  layout false

  before_filter :get_page

  def get_page
    @page = Redditor::Page.find(params[:redditor_page_id])
  end

end