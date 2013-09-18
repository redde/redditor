#coding: utf-8

class YoutubeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /[^A-z0-9_-]/
      record.errors[attribute] << (options[:message] || "- используются недопустимые символы")
    end
  end
end


module Redditor
  class VideoBlock < ActiveRecord::Base
    self.table_name = "redditor_video_blocks"

    # attr_accessible :height, :page_id, :position, :width, :youtube, :temp_id
    attr_accessor :temp_id

    validates :youtube, :length => { :is => 11 }, :youtube => true

    belongs_to :page, :class_name => "Redditor::Page"

    def self.model_name
      ActiveModel::Name.new(self, nil, 'VideoBlock')
    end
  end
end