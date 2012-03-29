module RailscastsDownload
  class Downloader
    def get( uri )
      filename = uri.split( '/' ).last
      unless File.exists? filename
        p %x(wget #{uri} -O #{filename}.tmp )
        p %x(mv #{filename}.tmp #{filename} )
      end
    end
  end
end
