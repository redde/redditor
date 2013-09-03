# coding: utf-8

require "redditor/version"
begin
  require 'rails/all'
rescue LoadError
  #do nothing
end

require "redditor/has_redditor"

require "generators/redditor/install/install_generator"
require "generators/redditor/views/views_generator"
require 'rails/generators/active_record'

module Redditor
  # Your code goes here...
end
