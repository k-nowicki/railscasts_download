class CommandStub
  def line_ac
    File.read( File.dirname( __FILE__ ) + '/../fixtures/upower_line_ac.txt' )
  end

  def battery
    File.read( File.dirname( __FILE__ ) + '/../fixtures/upower_battery.txt' )
  end
end