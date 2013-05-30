# coding: utf-8

class RedditorCreateTextBlocks < ActiveRecord::Migration
  def change
    create_table(:redditor_text_blocks) do |t|
      t.integer  "page_id"
      t.text     "body"
      t.integer  "position"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
    add_index :redditor_text_blocks, :page_id
  end
end