#coding: utf-8
module Redditor
  module FileapiHelper

    def fileapi url=nil
      html = stylesheet_link_tag "fileapi/fileapi"
      html += javascript_include_tag "fileapi/mailru"
      if url.present?
        html += javascript_tag do 
          %Q{FU.config.uploadUrl = "#{url}"}.html_safe
        end
      end
      content_for(:js, html)
    end

  end
end