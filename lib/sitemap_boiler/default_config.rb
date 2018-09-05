module SitemapBoiler
  class DefaultConfig
    def self.merge(config_hash)
      to_h.merge(config_hash)
    end

    def self.to_h
      {
        'urlset_headers' => {
          'xmlns'          => 'http://www.sitemaps.org/schemas/sitemap/0.9',
          'xhtml'          => 'http://www.w3.org/1999/xhtml',
          'xmlns:mobile'   => 'http://www.google.com/schemas/sitemap-mobile/1.0',
          'xmlns:image'    => 'http://www.google.com/schemas/sitemap-image/1.1',
          'xmlns:xhtml'    => 'http://www.w3.org/1999/xhtml'
        }
      }
    end
  end
end
