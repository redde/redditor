FactoryGirl.define do
  factory :page, class: Redditor::Page do

    factory :full_page do
      after(:create) do |page|
        create(:slider, page: page, position: 1)
        create(:text, page: page, position: 2)
        create(:video, page: page, position: 3)
      end
    end

    factory :slider_page do
      after(:create) do |page|
        create(:slider, page: page, position: 1)
      end
    end

    factory :video_page do
      after(:create) do |page|
        create(:video, page: page, position: 1)
      end
    end

    factory :text_page do
      after(:create) do |page|
        create(:text, page: page, position: 1)
      end
    end

    factory :image_page do
      after(:create) do |page|
        create(:image, page: page, position: 1)
      end
    end

  end
end