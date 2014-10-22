class Redditor::Page < ActiveRecord::Base
  self.table_name = "redditor_pages"
  belongs_to :pageable, polymorphic: true, touch: true
  has_many :text_blocks, class_name: "::Redditor::TmpTextBlock"
  has_many :video_blocks, class_name: "::Redditor::TmpVideoBlock"
  has_many :images, as: :imageable, class_name: "::Redditor::TmpImage"
  has_many :slider_blocks, class_name: "::Redditor::TmpSliderBlock"
  accepts_nested_attributes_for :text_blocks, allow_destroy: true
  accepts_nested_attributes_for :video_blocks, allow_destroy: true
  accepts_nested_attributes_for :slider_blocks, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  def content_blocks
    (text_blocks + video_blocks + images + slider_blocks).sort {|x, y| x.position <=> y.position}
  end
end