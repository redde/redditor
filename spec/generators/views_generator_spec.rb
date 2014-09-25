# coding: utf-8

require 'rails_helper'

describe Redditor::Generators::ViewsGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  after(:all) { FileUtils.rm_rf 'tmp' }

  it "generates views" do
    assert_directory "app/views/redditor/pages/_page.html.haml"
  end

end