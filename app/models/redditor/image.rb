# coding: utf-8

module Redditor
  class Image < ActiveRecord::Base
    self.table_name = "redditor_images"

    after_initialize :default_values # чтобы файл загружался, пока через html5 не передаем позицию

    # attr_accessible :descr, :imageable_id, :imageable_type, :position, :src, :temp_id
    attr_accessor :temp_id

    mount_uploader :src, RedditorUploader

    validates :src, :presence => true

    belongs_to :imageable, :polymorphic => true

    default_scope -> { order(:position) }

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Image')
    end

    private
      def default_values
        self.position ||= 1000
      end
  end
end