class Redditor::TmpSliderBlock < ActiveRecord::Base
  self.table_name = "redditor_slider_blocks"
  attr_accessor :object_id, :kind
  belongs_to :page, class_name: "::Redditor::Page", touch: true
  has_many :images, as: :imageable, dependent: :destroy, class_name: "::Redditor::TmpImage"
  accepts_nested_attributes_for :images
end