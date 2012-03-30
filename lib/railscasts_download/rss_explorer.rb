module RailscastsDownload
  class RssExplorer
    require 'rss'

    def initialize( rss_body )
      @body = rss_body
      get_rss
    end

    def get_uris
      @rss.items.map{ |it| it.enclosure.url }.reverse
    end

    private

      def get_rss
        @rss = RSS::Parser.parse( @body, false )
      end
  end
end
