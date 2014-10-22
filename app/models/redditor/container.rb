module Redditor
  class Container < ActiveRecord::Base
    # attr_accessor :image_ids

    belongs_to :redditable, polymorphic: true, touch: true
    default_scope { order(:position) }

    has_many :videos
    has_many :texts
    has_many :images

    accepts_nested_attributes_for :videos, :texts, :images

    # after_save :assign_images

    def contents
      (videos + texts + images).sort { |a, b| a.position <=> b.position }
    end

    private

    # def assign_images
    #   return true unless image_ids.present?
    #   image_ids ||= []
    #   Image.where(id: image_ids).update_all(container_id: self.id)
    # end
  end
end