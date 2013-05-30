# coding: utf-8

require 'spec_helper'

describe Redditor::Generators::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  after(:all) { FileUtils.rm_rf 'tmp' }

  it "generates all models" do
    %w{content_block.rb page.rb slider_block.rb text_block.rb video_block.rb}.each do |model|
      assert_file "app/models/redditor/#{model}"
    end
  end

  it "generates locale" do
    assert_file "config/locales/redditor.yml"
  end

  it "generates controllers" do
    %w{image_blocks images pages redditor slider_blocks text_blocks video_blocks}.each do |ctrl|
      assert_file "app/controllers/admin/redditor/#{ctrl}_controller.rb"
    end
  end

  it "generates migration" do
    file_list = Dir.glob("#{destination_root}/db/migrate/*.rb").map {|file| file.gsub(destination_root, "").gsub(/\d/, "").gsub("/db/migrate/_", "")}
    assert file_list.include? "redditor_create_pages.rb"
    assert file_list.include? "redditor_create_video_blocks.rb"
    assert file_list.include? "redditor_create_text_blocks.rb"
    assert file_list.include? "redditor_create_slider_blocks.rb"
    assert file_list.include? "redditor_create_images.rb"
  end

  it "generates styles" do
    assert_file "app/assets/stylesheets/admin/redditor.css.scss"
  end

  it "generates js" do
    assert_file "app/assets/javascripts/admin/redditor.coffee"
  end

  it "generates images" do
    assert_directory "app/assets/images/admin/redditor"
  end

  it "generates uploader" do
    assert_file "app/uploaders/redditor_uploader.rb"
  end

  it "generates views" do
    assert_directory "app/views/admin/pages"
  end

end