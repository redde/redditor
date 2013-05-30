class Redditor::SliderBlock < ActiveRecord::Base
  attr_accessible :page_id, :position, :temp_id
  attr_accessor :temp_id


  belongs_to :page
  has_many :images, :as => :imageable, :dependent => :destroy
end