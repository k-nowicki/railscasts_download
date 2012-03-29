require_relative './rss'
require_relative './downloader'

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
end
