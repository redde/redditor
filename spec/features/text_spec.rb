require 'spec_helper'

describe "Text block" do
  let(:article) { create(:article) }

  before(:each) do
    clean_database
  end

  it "Saves text block to article", type: :feature, js: true do
    visit "/admin/articles/#{article.id}/edit"
    find_link(I18n.t("redditor.add.text_block")).click
    page.find("textarea").set("test text block")
    find_button("Submit").click
    expect(page.find("textarea").value).to eq "test text block"
  end

  it "Shows validation error if text block content is empty", type: :feature, js: true do
    pending
  end

  it "Saves text block to article on save button", type: :feature, js: true do
    visit "/admin/articles/#{article.id}/edit"
    find_link(I18n.t("redditor.add.text_block")).click
    page.find("textarea").set("test text block")
    find_link("✔").click
    visit "/admin/articles/#{article.id}/edit"
    expect(page.find("textarea").value).to eq "test text block"
  end
end