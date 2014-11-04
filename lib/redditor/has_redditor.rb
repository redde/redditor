# coding: utf-8

class << ActiveRecord::Base
  def has_redditor
    # Include required methods
    # include Redditor::InstanceMethods
    # extend Redditor::ClassMethods

    # Save self as base class (for STI)

    cattr_accessor :redditor_base_class
    self.redditor_base_class = self
    has_one :page, :as => :pageable, class_name: "Redditor::Page"
    accepts_nested_attributes_for :page

    has_many :containers, -> { order :position }, as: :redditable, class_name: 'Redditor::Container'
    accepts_nested_attributes_for :containers, allow_destroy: true
    has_many :sliders, -> { order :position }, as: :redditable, class_name: 'Redditor::Slider'
    accepts_nested_attributes_for :sliders, allow_destroy: true
  end
end