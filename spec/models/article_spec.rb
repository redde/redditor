# coding: utf-8

require 'rails_helper'

describe Article do
  context "TEXT" do
    let(:article) { create(:text_article) }
    it "have valid number of text blocks from page" do
      expect(article.page.content_blocks.count).to eq 1
      expect(article.page.content_blocks.first.class.name).to eq "Redditor::TextBlock"
    end
  end # context "TEXT"

  context "SLIDER" do
    let(:article) { create(:slider_article) }
    it "have valid number of slider blocks from page" do
      expect(article.page.content_blocks.count).to eq 1
      expect(article.page.content_blocks.first.images.count).to eq 3
    end
  end # context "SLIDER"

  context "VIDEO" do
    let(:article) { create(:video_article) }
    it "have valid number of video blocks from page" do
      expect(article.page.content_blocks.count).to eq 1
      expect(article.page.content_blocks.first.class.name).to eq "Redditor::VideoBlock"
    end
  end # context "VIDEO"

  context "FULL" do
    let(:article) { create(:full_article) }
    it "have valid number of blocks from page" do
      expect(article.page.content_blocks.first.position).to eq 1
      expect(article.page.content_blocks.last.position).to eq 3
      expect(article.page.content_blocks.count).to eq 3
    end
  end # context "VIDEO"
end
