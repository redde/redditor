# coding: utf-8

class Article < ActiveRecord::Base
  has_redditor

  validates :title, presence: true
end
