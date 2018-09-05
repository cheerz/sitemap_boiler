module SitemapBoiler
  class URLComposer
    def self.compose(*args)
      args.select { |a| a && a != '' }.join('/')
    end
  end
end
