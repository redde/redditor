# coding: utf-8

require 'rails/generators'
require 'rails/generators/generated_attribute'

module Redditor
  module Generators
    class ViewsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../../../../../app/views', __FILE__)

      desc 'This generator creates views redditor files'
      def copy_views
        return copy_default_views if file_name == 'default'
        return copy_admin_views if file_name == 'admin'
        return copy_front_views if file_name == 'front'
      end

      private

      def copy_default_views
        directory "redditor", "app/views/redditor"
      end

      def copy_admin_views
        directory "redditor/admin", "app/views/redditor/admin"
      end

      def copy_front_views
        template "redditor/_image.html.haml", "app/views/redditor/_image.html.haml"
        template "redditor/_page.html.haml", "app/views/redditor/_page.html.haml"
        template "redditor/_slider_block.html.haml", "app/views/redditor/_slider_block.html.haml"
        template "redditor/_slider_block_image.html.haml", "app/views/redditor/_slider_block_image.html.haml"
        template "redditor/_text_block.html.haml", "app/views/redditor/_text_block.html.haml"
        template "redditor/_video_block.html.haml", "app/views/redditor/_video_block.html.haml"
      end

    end
  end
end
