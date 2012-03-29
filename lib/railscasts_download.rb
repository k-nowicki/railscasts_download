#!/usr/bin/ruby
require "railscasts_download/version"

module RailscastsDownload
  class Saver
    def initialize( params={} )
      @saver = params[:downloader] || Downloader.new
      uri = params[:rss_uri] || "http://feeds.feedburner.com/railscasts"
      @rss = Rss.new( uri )
    end

    def get_all
      missing_videos_uris.each{ |video_uri| get_file( video_uri ) }
    end

    def get_file( uri )
      @saver.get( uri )
    end

    def videos_uris
      @rss.get_uris
    end

    def missing_videos_uris
      videos_filenames = videos_uris.map { |url| url.split( '/' ).last }
      missing_files = videos_filenames - Dir.glob( '*.mp4' )
      videos_uris.select{ |uri| missing_files.any? { |filename| uri.match filename } }
    end
  end

  class Downloader
    def get( uri )
      filename = uri.split( '/' ).last
      unless File.exists? filename
        p %x(wget #{uri} -O #{filename}.tmp )
        p %x(mv #{filename}.tmp #{filename} )
      end
    end
  end

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
