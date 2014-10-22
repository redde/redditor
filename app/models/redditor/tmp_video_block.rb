class Redditor::TmpVideoBlock < ActiveRecord::Base
  self.table_name = "redditor_video_blocks"
  attr_accessor :object_id
  belongs_to :page, class_name: "::Redditor::Page", touch: true
end