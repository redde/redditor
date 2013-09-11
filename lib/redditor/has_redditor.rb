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

  end
end