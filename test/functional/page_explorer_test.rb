class PageExplorerTest < Test::Unit::TestCase
  def setup
    @source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt'
    @page_explorer =  RailscastsDownload::PageExplorer.new( rss_uri: @source_file)
  end
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def test_rss_body_returns_correct_body
    assert_equal( open( @source_file ).read, @page_explorer.get_rss_body )
  end

end
