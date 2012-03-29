class RailscastsDownloadInEmptyEnvTestClear < Test::Unit::TestCase
  def setup
    source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt'
    downloader = StubDownloader.new
    @saver =  RailscastsDownload::Saver.new( downloader: downloader, rss_uri: source_file )
  end
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def test_videos_uris_nothing_raised
    assert_nothing_raised { @saver.videos_uris }
  end

  def test_missing_videos_uris_nothing_raised
    assert_nothing_raised { @saver.missing_videos_uris }
  end

  def test_videos_uris_returns_correct_values
    assert_equal( "http://media.railscasts.com/assets/episodes/videos/001-caching-with-instance-variables.mp4",
                  @saver.videos_uris.first )
  end

  def test_missing_videos_uris_returns_correct_value
    assert_equal( "http://media.railscasts.com/assets/episodes/videos/001-caching-with-instance-variables.mp4",
                  @saver.missing_videos_uris.first )
  end

  def test_videos_uris_returns_all_uris
    assert_equal( 311, @saver.videos_uris.count )
  end

  def test_missing_videos_uris_returns_all_uris
    assert_equal( 311, @saver.missing_videos_uris.count )
  end
end

class RailscastsDownloadWithSomeVideoesTest < Test::Unit::TestCase
  def setup
    source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt'
    @saver =  RailscastsDownload::Saver.new( rss_uri: source_file )
    File.new( "001-caching-with-instance-variables.mp4", "w+" ).close
  end

  def teardown
    Dir.glob( '*.mp4' ).each { |file| File.delete(file)}
  end
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def test_missing_videos_uris_returns_correct_value
    assert_equal( "http://media.railscasts.com/assets/episodes/videos/002-dynamic-find-by-methods.mp4",
                  @saver.missing_videos_uris.first )
  end

  def test_videos_uris_returns_all_uris
    assert_equal( 311, @saver.videos_uris.count )
  end

  def test_missing_videos_uris_returns_only_missing_uris
    assert_equal( 310, @saver.missing_videos_uris.count )
  end
end