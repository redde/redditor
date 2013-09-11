require 'spec_helper'

describe "Text block" do
  let(:article) { create(:article) }

  it "Saves text block to article", type: :feature do
    visit "/admin/articles/#{article.id}/edit"
    # click_button "Text"
  end
end