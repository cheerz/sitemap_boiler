require 'sitemap_boiler/default_config'
require 'json'

module SitemapBoiler
  class Config
    attr_accessor :config_hash

    def initialize(config_hash)
      @config_hash = DefaultConfig.merge(config_hash)
    end

    def [](key)
      config_hash[key.to_s]
    end

    def self.from_file config_path
      config_hash = JSON.parse(File.read(config_path))
      new(config_hash)
    end

    private

    def read_config(path)
      JSON.parse File.open(path).read
    end
  end
end
