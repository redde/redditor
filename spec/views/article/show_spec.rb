require 'spec_helper'

describe "articles/show.html.haml" do

  before(:each) do
    assign(:article, create(:full_article))
    render template: "articles/show"
  end

  it "displays redditor text content" do
    expect(rendered.index("text_block") > 0).to eq true
  end

  it "displays redditor video content" do
    expect(rendered.index("video_block") > 0).to eq true
  end

  it "displays redditor slider content" do
    expect(rendered.index("slider_block") > 0).to eq true
  end

end