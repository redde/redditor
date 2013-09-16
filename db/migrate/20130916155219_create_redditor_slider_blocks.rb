class CreateRedditorSliderBlocks < ActiveRecord::Migration
  def change
    create_table(:redditor_slider_blocks) do |t|
      t.integer  "page_id"
      t.integer  "position"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
    add_index :redditor_slider_blocks, :page_id
  end
end
