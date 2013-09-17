# coding: utf-8

require 'spec_helper'

describe "Text block" do
  let(:article) { create(:article) }

  before(:each) do
    clean_database
    visit "/admin/articles/#{article.id}/edit"
  end

  def add_block() find_link(I18n.t("redditor.add.text_block")).click; end
  def submit() find_button("Submit").click; end
  def save_block() find_link("✔").click; end
  def delete_block() find_link("✘").click; end

  it "Saves text block to article", type: :feature, js: true do
    add_block
    page.find("textarea").set("test text block")
    submit
    expect(page.find("textarea").value).to eq "test text block"
  end

  it "Shows validation error if text block content is empty", type: :feature, js: true do
    add_block
    submit
    expect(page).to have_content "can't be blank"
  end

  it "Deletes text block", type: :feature, js: true do
    article.page.text_blocks.build(body: "123", position: 1).save
    visit "/admin/articles/#{article.id}/edit"
    delete_block
    visit "/admin/articles/#{article.id}/edit"
    expect(page).not_to have_content "123"
  end

  it "Saves text block to article on save button", type: :feature, js: true do
    add_block
    page.find("textarea").set("test text block")
    save_block
    visit "/admin/articles/#{article.id}/edit"
    expect(page.find("textarea").value).to eq "test text block"
  end
end