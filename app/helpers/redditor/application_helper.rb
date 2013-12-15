module Redditor
  module ApplicationHelper
    def real_name content_block
      content_block.class.name.underscore.sub('redditor/', '')
    end

    def redditor_validate f
      render "redditor/validate", {f: f} 
    end
  end
end
