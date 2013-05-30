# coding: utf-8

class Redditor::TextBlock < ActiveRecord::Base
  attr_accessible :body, :page_id, :position, :temp_id, :translations_attributes
  attr_accessor :temp_id

  belongs_to :page

  default_scope order(:position)

  validates :position, :body, :presence => true

  translates :body
  accepts_nested_attributes_for :translations
end