require_relative './rss_explorer'
require_relative './downloader'
require_relative './page_explorer'

module RailscastsDownload
  class Saver
    def initialize( options={} )
      @downloader = options[:downloader] || Downloader.new
      options[:rss_uri] ||= "http://feeds.feedburner.com/railscasts" unless options[:revised]
      options[:login_uri] ||= "http://railscasts.com/login" if options[:revised]
      @page = options[:page_explorer] || PageExplorer.new( options )
      @rss = options[:rss_explorer] || RssExplorer.new( @page.get_rss_body )
    end

    def get_all
      missing_videos_uris.each{ |video_uri| get_file( video_uri ) }
    end

    def get_file( uri )
      @downloader.get( uri )
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
