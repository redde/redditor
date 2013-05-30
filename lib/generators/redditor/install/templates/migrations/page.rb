# coding: utf-8

class RedditorCreatePages < ActiveRecord::Migration
  def change
    create_table(:redditor_pages) do |t|
      t.integer  "pageable_id"
      t.string   "pageable_type"
      t.datetime "created_at",    :null => false
      t.datetime "updated_at",    :null => false
    end
    add_index :redditor_pages, :pageable_type
    add_index :redditor_pages, :pageable_id
  end
end