class CreateRedditorImages < ActiveRecord::Migration
  def change
    create_table(:redditor_images) do |t|
      t.integer  "imageable_id"
      t.string   "imageable_type"
      t.integer  "position"
      t.string   "src"
      t.string   "description"
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
    end
    add_index :redditor_images, :imageable_type
    add_index :redditor_images, :imageable_id
  end
end
