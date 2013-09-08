# coding: utf-8

class CreateRedditor < ActiveRecord::Migration
  def change
    transaction do
      create_table(:redditor_images) do |t|
        t.integer  "imageable_id"
        t.string   "imageable_type"
        t.integer  "position"
        t.string   "src"
        t.string   "descr"
        t.datetime "created_at",     :null => false
        t.datetime "updated_at",     :null => false
      end
      add_index :redditor_images, :imageable_type
      add_index :redditor_images, :imageable_id

      create_table(:redditor_pages) do |t|
        t.integer  "pageable_id"
        t.string   "pageable_type"
        t.datetime "created_at",    :null => false
        t.datetime "updated_at",    :null => false
      end
      add_index :redditor_pages, :pageable_type
      add_index :redditor_pages, :pageable_id

      create_table(:redditor_slider_blocks) do |t|
        t.integer  "page_id"
        t.integer  "position"
        t.datetime "created_at", :null => false
        t.datetime "updated_at", :null => false
      end
      add_index :redditor_slider_blocks, :page_id

      create_table(:redditor_text_blocks) do |t|
        t.integer  "page_id"
        t.text     "body"
        t.integer  "position"
        t.datetime "created_at", :null => false
        t.datetime "updated_at", :null => false
      end
      add_index :redditor_text_blocks, :page_id

      create_table(:redditor_video_blocks) do |t|
        t.integer  "page_id"
        t.integer  "position"
        t.integer  "width"
        t.integer  "height"
        t.string   "youtube"
        t.datetime "created_at", :null => false
        t.datetime "updated_at", :null => false
      end
      add_index :redditor_video_blocks, :page_id
    end
  end
end