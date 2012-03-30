class StubPageExplorer
  def initialize( options = {} )
  end

  def get_rss_body
    source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt'
    open( source_file ).read
  end
end