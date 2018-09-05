require 'builder'
require 'sitemap_boiler/url_composer'

module SitemapBoiler
  class SitemapGenerator
    attr_accessor :config

    def initialize config
      @config = config
    end

    def write localization, path
      File.open(path, 'w') { |file| file.write(to_xml(localization)) }
    end

    def location_url config, localization, page
      URLComposer.compose(config[:base_url], localization['prefix'], page['path'])
    end

    def to_xml localization
      xml_markup.urlset(config[:urlset_headers]) do |urlset|
        config[:pages].each do |page|
          urlset.url do |url|
            url.loc location_url(config, localization, page)
            config[:localizations].each do |alternate|
              url.tag!('xhtml:link', 
                href: location_url(config, alternate, page),
                hreflang: alternate['hreflang'],
                rel: :alternate
                )
            end
            if page['android_url']
              url.tag!('xhtml:link', href: page['android_url'], rel: :alternate)
            end
          end
        end
      end
    end

    private

    def xml_markup
      xml = Builder::XmlMarkup.new(indent: 2)
      xml.instruct! :xml, encoding: 'UTF-8'
      xml
    end
  end
end
