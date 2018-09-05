require 'spec_helper'
require 'fileutils'

RSpec.describe SitemapBoiler do
  before(:all) do 
    FileUtils.mkdir_p('./tmp')
    Dir.glob('./tmp/sitemap*').each do |filepath|
      FileUtils.rm(filepath)
    end
  end

  it 'has a version number' do
    expect(SitemapBoiler::VERSION).not_to be nil
  end

  it 'generates the sitemaps' do
    config_hash = JSON.parse(File.read('./spec/fixtures/sitemap_config.json'))
    SitemapBoiler.generate config_hash, './tmp'
    expect(Dir.glob('./tmp/sitemap*')).not_to be_empty
  end

end
