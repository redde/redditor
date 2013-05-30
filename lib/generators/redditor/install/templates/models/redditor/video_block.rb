#coding: utf-8
class YoutubeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /[a-zA-Z0-9_-]{11}/
      record.errors[attribute] << (options[:message] || "- используются недопустимые символы")
    end
  end
end

class Redditor::VideoBlock < ActiveRecord::Base
  attr_accessible :height, :page_id, :position, :width, :youtube, :temp_id

  attr_accessor :temp_id

  validates :youtube, :length => { :is => 11 }, :youtube => true

  belongs_to :page
end