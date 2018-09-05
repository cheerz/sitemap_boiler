require 'spec_helper'
require 'pry'

RSpec.describe SitemapBoiler::SitemapGenerator do
  it 'merges the base config with the default' do
    config = SitemapBoiler::Config.new('./spec/fixtures/sitemap_config.json')
    generator = SitemapBoiler::SitemapGenerator.new(config)
    xml = generator.to_xml(config[:localizations].first)
    expected_xml = File.open('./spec/fixtures/expected_sitemap_xdefault.xml').read
    
    expect(xml).to eq(expected_xml)
  end
end
