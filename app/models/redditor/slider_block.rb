# coding: utf-8

module Redditor
  class SliderBlock < ActiveRecord::Base
    self.table_name = "redditor_slider_blocks"

    attr_accessor :object_id, :kind

    belongs_to :page, class_name: "::Redditor::Page", touch: true
    has_many :images, as: :imageable, dependent: :destroy, class_name: "::Redditor::Image"
    accepts_nested_attributes_for :images

    def to_partial_path
      'redditor/slider_block'
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, 'SliderBlock')
    end
  end
end