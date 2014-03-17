# coding: utf-8

module Redditor
  class SliderBlock < ActiveRecord::Base
    self.table_name = "redditor_slider_blocks"

    attr_accessor :object_id, :kind

    belongs_to :page, class_name: "Redditor::Page", touch: true
    has_many :images, as: :imageable, dependent: :destroy
    accepts_nested_attributes_for :images

    def self.model_name
      ActiveModel::Name.new(self, nil, 'SliderBlock')
    end
  end
end