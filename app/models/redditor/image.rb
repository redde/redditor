module Redditor
  class Image < ActiveRecord::Base
    self.table_name = "redditor_images"
    attr_accessor :object_id
    belongs_to :imageable, polymorphic: true, touch: true
    validates :src, presence: true
    mount_uploader :src, RedditorUploader
    default_scope -> { order(:position) }
    after_initialize :set_default_values # чтобы файл загружался, пока через html5 не передаем позицию

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Image')
    end

    def to_partial_path
      'redditor/image'
    end

    private

    def set_default_values
      self.position ||= 1000
    end
  end
end
