FactoryGirl.define do
  factory :article do
    title "Test article"

    factory :full_article do
      association :page, factory: :full_page
    end

    factory :text_article do
      association :page, factory: :text_page
    end


    factory :slider_article do
      association :page, factory: :slider_page
    end

    factory :image_article do
      association :page, factory: :image_page
    end

    factory :video_article do
      association :page, factory: :video_page
    end

  end
end