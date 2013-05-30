#coding: utf-8

class Redditor::Page < ActiveRecord::Base
  attr_accessible :pageable_id, :pageable_type, :metakey, :metadesc, :text_blocks_attributes, :video_blocks_attributes, :images_attributes, :slider_blocks_attributes

  belongs_to :pageable, :polymorphic => true
  has_many :text_blocks
  has_many :video_blocks
  has_many :images, :as => :imageable
  has_many :slider_blocks
  accepts_nested_attributes_for :text_blocks, :allow_destroy => true
  accepts_nested_attributes_for :video_blocks, :allow_destroy => true
  accepts_nested_attributes_for :slider_blocks, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true

  def content_blocks
    (self.text_blocks + self.video_blocks + self.images + self.slider_blocks).sort {|x, y| x.position <=> y.position}
  end
end