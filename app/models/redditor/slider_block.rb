# coding: utf-8

module Redditor
  class SliderBlock < ActiveRecord::Base
    self.table_name = "redditor_slider_blocks"

    # attr_accessible :page_id, :position, :temp_id
    attr_accessor :temp_id

    belongs_to :page, :class_name => "Redditor::Page"
    has_many :images, :as => :imageable, :dependent => :destroy

    def self.model_name
      ActiveModel::Name.new(self, nil, 'SliderBlock')
    end
  end
end