class Redditor::TmpTextBlock < ActiveRecord::Base
  self.table_name = "redditor_text_blocks"
  attr_accessor :object_id
  belongs_to :page, class_name: "::Redditor::Page", touch: true
  default_scope -> { order(:position) }
  validates :position, :content, presence: true
end