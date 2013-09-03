# coding: utf-8

require 'spec_helper'

describe Redditor::Generators::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  after(:all) { FileUtils.rm_rf 'tmp' }

  it "generates migration" do
    file_list = Dir.glob("#{destination_root}/db/migrate/*.rb").map {|file| file.gsub(destination_root, "").gsub(/\d/, "").gsub("/db/migrate/_", "")}
    assert file_list.include? "create_redditor.rb"
  end

end