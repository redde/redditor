FactoryGirl.define do
  factory :slider, class: Redditor::SliderBlock do
    after(:create) do |slider|
      3.times do
        create(:image, imageable_id: slider.id, imageable_type: slider.class.name)
      end
    end
  end
end