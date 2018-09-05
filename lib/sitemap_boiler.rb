require "sitemap_boiler/version"
require "sitemap_boiler/config"
require "sitemap_boiler/sitemap_generator"

module SitemapBoiler

  def self.generate config_path, output_dir
    config = SitemapBoiler::Config.new(config_path)
    generator = SitemapBoiler::SitemapGenerator.new(config)
    config[:localizations].each do |localization|
      file_suffix = localization['prefix'] || 'default'
      generator.write(localization, "#{ output_dir }/sitemap-#{ file_suffix }.xml")
    end
  end

end
