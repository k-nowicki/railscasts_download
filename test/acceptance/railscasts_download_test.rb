#Setup env here to speedup (true) or reality (false)
MOCKED_RSS         = true
STUBBED_DOWNLOADER = true
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class RailscastDownloadTest < Test::Unit::TestCase
  def setup
    source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt' if MOCKED_RSS
    downloader = StubDownloader.new if STUBBED_DOWNLOADER
    @saver =  RailscastsDownload::Saver.new( downloader: downloader, rss_uri: source_file )
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