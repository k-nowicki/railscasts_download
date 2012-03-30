module RailscastsDownload
  class RssExplorer
    require 'rss'
    require 'date'

    def initialize( rss_body )
      @body = rss_body
      get_rss
    end

    def get_uris( options = {} )
      @after = Date.parse( options[:after] || '2000-01-01' )
      @rss.items.reject{ |it| it.pubDate.to_date < @after }.map{ |it| it.enclosure.url }.reverse
    end

    private

      def get_rss
        @rss = RSS::Parser.parse( @body, false )
      end
  end
end
