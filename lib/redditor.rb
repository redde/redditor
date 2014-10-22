Gem.loaded_specs['redditor'].dependencies.select do |i|
  i.type == :runtime
end.each do |d|
 require d.name
end

require "redditor/engine"
require "redditor/container_migrator_up"
require 'redditor/has_redditor'
require "generators/redditor/views/views_generator"
require 'rails/generators/active_record'

module Redditor
end
