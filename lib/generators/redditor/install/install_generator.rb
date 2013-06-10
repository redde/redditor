require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/generated_attribute'

module Redditor
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def copy_models
        directory "models/redditor", "app/models/redditor"
      end

      def copy_controllers
        directory "controllers/admin/redditor", "app/controllers/admin/redditor"
      end

      def copy_locale
        template "locales/redditor.yml", "config/locales/redditor.yml"
      end

      def copy_images
        directory "assets/images/admin/redditor", "app/assets/images/admin/redditor"
      end

      def copy_js
        directory "assets/javascripts/admin", "app/assets/javascripts/admin"
      end

      def copy_styles
        directory "assets/stylesheets/admin", "app/assets/stylesheets/admin"
      end

      def copy_uploader
        template "uploaders/redditor_uploader.rb", "app/uploaders/redditor_uploader.rb"
      end

      def copy_views
        directory "views/admin/pages", "app/views/admin/redditor/pages"
      end

      def generate_migration
        migration_template "migrations/create_redditor.rb", "db/migrate/create_redditor.rb" unless migration_exists?("create_redditor")
      end

      private

        def migration_exists?(name)
          Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_redditor_create_#{name}.rb$/).first
        end

        def migration_path
          @migration_path ||= File.join("db", "migrate")
        end

    end
  end
end
