module RailscastsDownload
  class Rss
    require 'rss'

    def initialize( uri )
      get_rss( uri )
    end

    def get_uris
      @rss.items.map{ |it| it.enclosure.url }.reverse
    end

    private

      def get_rss( uri )
        @rss = RSS::Parser.parse( open( uri ).read, false )
      end
  end
end
