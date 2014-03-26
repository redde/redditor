module Redditor
  class VideoBlock < ActiveRecord::Base
    self.table_name = "redditor_video_blocks"

    attr_accessor :object_id

    validates :youtube, length: { is: 11 }, youtube: true

    belongs_to :page, class_name: "::Redditor::Page", touch: true

    def self.model_name
      ActiveModel::Name.new(self, nil, 'VideoBlock')
    end
  end
end