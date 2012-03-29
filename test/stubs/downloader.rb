class StubDownloader
  def get( uri )
    filename = uri.split( '/' ).last
    unless File.exists? filename
      File.new(filename,"w+").close
    end
  end
end