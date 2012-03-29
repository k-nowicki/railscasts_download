
class RssTest < Test::Unit::TestCase
  def setup
    source_file = File.dirname( __FILE__ ) + '/../fixtures/rss.txt'
    @rss =  RailscastsDownload::Rss.new( source_file )
  end
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def test_get_uris_returns_array
    assert_instance_of( Array, @rss.get_uris )
  end

  def test_get_uris_returns_correct_uris
    assert_equal( "http://media.railscasts.com/assets/episodes/videos/001-caching-with-instance-variables.mp4",
                  @rss.get_uris.first )
  end
end
