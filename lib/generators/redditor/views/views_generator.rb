# coding: utf-8

require 'rails/generators'
require 'rails/generators/generated_attribute'

module Redditor
  module Generators
    class ViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../../../../app/views', __FILE__)

      def copy_views
        directory "redditor", "app/views/redditor"
      end

    end
  end
end
