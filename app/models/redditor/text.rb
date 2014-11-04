# coding: utf-8

module Redditor
  class Text < ActiveRecord::Base
    self.table_name = "redditor_text_blocks"

    attr_accessor :object_id

    belongs_to :page, class_name: "::Redditor::Page", touch: true

    default_scope -> { order(:position) }

    validates :position, :content, presence: true

    def to_partial_path
      'redditor/text_block'
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, 'TextBlock')
    end
  end
end