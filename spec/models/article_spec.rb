# coding: utf-8

require 'spec_helper'

describe Article do
  it "Properly find redditor" do
    a = Article.new
    a.build_page
    expect(a.page.class.name).to eq "Redditor::Page"
  end
  
end
