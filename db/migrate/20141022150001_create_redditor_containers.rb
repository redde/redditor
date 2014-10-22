class CreateRedditorContainers < ActiveRecord::Migration
  def change
    create_table :redditor_containers do |t|
      t.string :type, index: true
      t.integer :position
      t.string :redditable_type, index: true
      t.integer :redditable_id, index: true
      t.text :options
      t.timestamps
    end

    add_column :redditor_video_blocks, :container_id, :integer, index: true
    rename_column :redditor_video_blocks, :youtube, :link
    add_column :redditor_video_blocks, :options, :text

    add_column :redditor_text_blocks, :container_id, :integer, index: true
    rename_column :redditor_text_blocks, :body, :content

    add_column :redditor_images, :container_id, :integer, index: true
    rename_column :redditor_images, :description, :title
    add_column :redditor_images, :options, :text
  end
end
