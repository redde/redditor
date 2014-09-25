require 'rails_helper'

describe "articles/show" do
  before(:each) do
    # assign(:article, FactoryGirl.create(:full_article))
    # render template: "articles/show"
  end

  it "displays redditor text content" do
    pending
    expect(rendered.index("text_block") > 0).to eq true
  end

  it "displays redditor video content" do
    pending
    expect(rendered.index("video_block") > 0).to eq true
  end

  it "displays redditor slider content" do
    pending
    expect(rendered.index("slider_block") > 0).to eq true
  end
end
