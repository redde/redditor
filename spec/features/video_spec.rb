# coding: utf-8

require 'rails_helper'

describe "Video block" do
  let(:article) { create(:article) }

  before(:each) do
    clean_database
    visit_article
  end

  def visit_article() visit "/admin/articles/#{article.id}/edit"; end
  def add_block() find_link(I18n.t("redditor.add.video_block")).click; end
  def submit() find_button("Submit").click; end
  def save_block() find("a.redditor__update").click; end
  def delete_block() find("a.redditor__delete").click; end

  it "Saves video block to article", type: :feature, js: true do
    add_block
    page.find(".video-block-input").set("1"*11)
    submit
    wait_until { expect(page.find("iframe").nil?).to eq false }
  end

  it "Shows validation error if youtube block url is empty or invalid", type: :feature, js: true do
    add_block
    submit
    expect(page).to have_content "is the wrong length"
  end

  it "Deletes video block", type: :feature, js: true do
    article.page.video_blocks.build(youtube: "1"*11, position: 1).save
    visit_article
    delete_block
    visit_article
    video_frame = begin
      page.find("iframe")
    rescue
      nil
    end
    wait_until { expect(video_frame).to eq nil }
  end

  it "Saves video block to article on save button", type: :feature, js: true do
    add_block
    page.find(".video-block-input").set("1"*11)
    save_block
    visit_article
    wait_until { expect(page.find("iframe").nil?).to eq false }
  end
end
