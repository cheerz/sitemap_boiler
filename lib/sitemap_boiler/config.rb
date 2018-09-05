require 'sitemap_boiler/default_config'
require 'json'

module SitemapBoiler
  class Config
    attr_accessor :config_hash

    def initialize(path)
      current_config_hash = read_config(path)
      @config_hash = DefaultConfig.merge(current_config_hash)
    end

    def [](key)
      config_hash[key.to_s]
    end

    private

    def read_config(path)
      JSON.parse File.open(path).read
    end
  end
end
