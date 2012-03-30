class RssExplorerbTest < Test::Unit::TestCase
  def setup
    source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt'
    @rss =  RailscastsDownload::RssExplorer.new( open( source_file ).read )
  end
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def test_get_uris_returns_array
    assert_instance_of( Array, @rss.get_uris )
  end

  def test_get_uris_returns_correct_uris
    assert_equal( "http://media.railscasts.com/assets/episodes/videos/001-caching-with-instance-variables.mp4",
                  @rss.get_uris.first )
  end

  def test_get_uris_after_returns_correct_uris
    assert_equal( "http://media.railscasts.com/assets/episodes/videos/336-copycopter.mp4",
                  @rss.get_uris( after: '2012-03-22' ).first )
  end
end