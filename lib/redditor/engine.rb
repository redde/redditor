module Redditor
  class Engine < ::Rails::Engine
    isolate_namespace Redditor

    initializer 'redditor.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Redditor::ApplicationHelper
      end
    end
  end
end
