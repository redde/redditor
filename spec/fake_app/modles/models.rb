# models
class Article < ActiveRecord::Base
  has_redditor
end

# a model with namespace
class TestNamespace::Page < ActiveRecord::Base
  has_redditor
end

#migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:articles) {|t| t.string :title }
    create_table(:test_namespace_pages) {|t| t.string :title }
  end
end
ActiveRecord::Migration.verbose = false
CreateAllTables.up