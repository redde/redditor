# require 'rails/all'
require 'action_controller/railtie'
require 'action_view/railtie'

require 'fake_app/config'

# config
app = Class.new(Rails::Application)
app.config.secret_token = '3b6cd727ee24e8321053457c36cc66c4'
app.config.session_store :cookie_store, :key => '_myapp_session'
app.config.active_support.deprecation = :log
app.config.eager_load = false
# Rais.root
app.config.root = File.dirname(__FILE__)
Rails.backtrace_cleaner.remove_silencers!
app.initialize!

# routes
app.routes.draw do
  resources :users
end

#models
require 'fake_app/models' if defined? ActiveRecord

# controllers
class ApplicationController < ActionController::Base; end
class ArticlesController < ApplicationController
  def show
    @users = Article.find params[:id]
    render :inline => <<-ERB
<%= @page.redditor_content %>
ERB
  end
end

if defined? ActiveRecord
  class PagesController < ApplicationController
    def show
      @page = TestNamespace::page.find(params[:id])
      render :inline => <<-ERB
  <%= @page.redditor_content %>
  ERB
    end
  end
end

# helpers
Object.const_set(:ApplicationHelper, Module.new)