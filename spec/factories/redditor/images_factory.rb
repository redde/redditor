FactoryGirl.define do

  sequence(:image_name) { |n| "image name #{n}" }

  factory :image, class: Redditor::TmpImage do
    description { generate(:image_name) }
    src { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
  end
end