# coding: utf-8

module Redditor
  class TextBlock < ActiveRecord::Base
    self.table_name = "redditor_text_blocks"

    attr_accessible :body, :page_id, :position, :temp_id, :translations_attributes
    attr_accessor :temp_id

    belongs_to :page, :class_name => "Redditor::Page"

    default_scope order(:position)

    validates :position, :body, :presence => true

    translates :body
    accepts_nested_attributes_for :translations
  end
end