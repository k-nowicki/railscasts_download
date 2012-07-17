module RailscastsDownload
  class Downloader
    def initialize( proxy )
      @proxy = proxy
    end

    def get( uri )
      filename = uri.split( '/' ).last
      unless File.exists? filename
        p %x(#{@proxy.nil? ? nil : "export http_proxy=#{@proxy} && "}wget #{uri} -O #{filename}.tmp )
        p %x(mv #{filename}.tmp #{filename} )
      end
    end
  end
end
