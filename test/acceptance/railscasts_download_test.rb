#Setup env here to speedup (true) or reality (false)
STUBBED    = true
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class RailscastDownloadTest < Test::Unit::TestCase
  def setup
    options ={
      source_file: File.dirname( __FILE__ ) + '/../fixtures/rss.txt',
      downloader: StubDownloader.new,
      rss_explorer: StubRssExplorer.new,
      page_explorer: StubPageExplorer.new
    } if STUBBED
    @saver =  RailscastsDownload::Saver.new( options )
  end

  def teardown
    Dir.glob( '*.mp4' ).each { |file| File.delete(file)}
  end
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def test_get_file_nothing_raised
    assert_nothing_raised {@saver.get_file("001-caching-with-instance-variables.mp4") }
  end

  def test_get_all_nothing_raised
    assert_nothing_raised { @saver.get_all }
  end
end