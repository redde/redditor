class Redditor::TmpImage < ActiveRecord::Base
  self.table_name = "redditor_images"
  after_initialize :set_default_values
  attr_accessor :object_id
  mount_uploader :src, RedditorUploader
  validates :src, presence: true
  belongs_to :imageable, polymorphic: true, touch: true
  default_scope -> { order(:position) }
  def set_default_values
    self.position ||= 1000
  end
end