class StubRssExplorer
  def initialize
  end

  def get_uris( options = {} )
    source_file = File.dirname( __FILE__ ) + '/../fixtures/uris.txt'
    open( source_file ).read.each_line.map{ |l| l[0, ( l.length-1) ] }
  end
end
