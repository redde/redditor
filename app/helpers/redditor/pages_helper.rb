# coding: utf-8

module Redditor
  module PagesHelper
    def redditor_validate f
      render "redditor/admin/pages/validate", {f: f} 
    end
  end
end
