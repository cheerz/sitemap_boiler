require 'spec_helper'

RSpec.describe SitemapBoiler::Config do
  it 'merges the base config with the default' do
    config = SitemapBoiler::Config.from_file('./spec/fixtures/sitemap_config.json')
    expect(config[:base_url]).not_to be_nil
    expect(config[:urlset_headers]).not_to be_empty
  end
end
