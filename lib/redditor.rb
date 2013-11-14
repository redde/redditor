require "redditor/engine"
require 'redditor/has_redditor'
require "generators/redditor/views/views_generator"
require 'rails/generators/active_record'
require 'carrierwave/orm/activerecord'

require_relative '../app/uploaders/redditor_uploader'
require_relative '../app/models/redditor/page'
require_relative '../app/models/redditor/content_block'
require_relative '../app/uploaders/redditor_uploader'
require_relative '../app/models/redditor/image'
require_relative '../app/models/redditor/slider_block'
require_relative '../app/models/redditor/text_block'
require_relative '../app/models/redditor/video_block'

module Redditor
end
