# coding: utf-8

class Redditor::ContentBlock < ActiveRecord::Base

  def self.find_by_position_and_type(position, type, page_id)
    type.to_s.sub("s_attributes", "").camelcase.constantize.where(page_id: page_id, position: position).first
  end

  def self.init_by_type(type, params)
    res = type.to_s.sub("s_attributes", "").camelcase.constantize.new(params)
    res.valid?
    res
  end

  def self.check_by_position_and_type position, type, page_id
    type.to_s.sub("s_attributes", "").camelcase.constantize.where(page_id: page_id, position: position).any?
  end

end