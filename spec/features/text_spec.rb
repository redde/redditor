# coding: utf-8

require 'rails_helper'

describe "Text block" do
  let(:article) { create(:article) }

  before(:each) do
    clean_database
    visit_article
  end

  def visit_article() visit "/admin/articles/#{article.id}/edit"; end
  def add_block() find_link(I18n.t("redditor.add.text_block")).click; sleep 1; end
  def show_text_area() page.execute_script("$('.redditor__textarea').show()"); sleep 1; end
  def submit() find_button("Submit").click; end
  def save_block() find("a.redditor__update").click; end
  def delete_block() find("a.redditor__delete").click; end

  it "Saves text block to article", type: :feature, js: true do
    pending
    add_block
    show_text_area
    find(".redditor__textarea").set("test text block")
    submit
    show_text_area
    expect(find(".redditor__textarea").value).to have_content "test text block"
  end

  it "Shows validation error if text block content is empty", type: :feature, js: true do
    # pending
    add_block
    submit
    wait_until { expect(page).to have_content "can't be blank" }
  end

  it "Deletes text block", type: :feature, js: true do
    # pending
    article.page.text_blocks.build(body: "123", position: 1).save
    visit_article
    delete_block
    visit_article
    text_value = begin
      page.find("textarea").value
    rescue
      nil
    end
    wait_until { expect(text_value).to eq nil }
  end

  it "Saves text block to article on save button", type: :feature, js: true do
    pending
    add_block
    show_text_area
    find("textarea").set("test text block")
    save_block
    visit_article
    show_text_area
    expect(find(".redditor__textarea").value).to have_content "test text block"
  end
end
