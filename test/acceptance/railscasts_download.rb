require File.expand_path( "../../../lib/railscast_download", __FILE__ )
require 'test/unit'
require "turn"


class RailscastDownloadTest < Test::Unit::TestCase

  def setup
  end

  def test_get_all_returns_correct_hash
    assert_instance_of( Hash, {} )
  end

end