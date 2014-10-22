class CreateRedditorVideoBlocks < ActiveRecord::Migration
  def change
    create_table(:redditor_video_blocks) do |t|
      t.integer  "page_id"
      t.integer  "position"
      t.integer  "width"
      t.integer  "height"
      t.string   "youtube"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    add_index :redditor_video_blocks, :page_id
  end
end
