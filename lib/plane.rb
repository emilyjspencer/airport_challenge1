class Plane
  attr_reader :airborne 

  def initialize # upon initialization the plan is flying
    @airborne = true
  end 

  def take_off
    fail "Unable to take off: plane already airborne" if airborne_plane
    @airborne = true # when a plane takes off, it is airborne
  end 

  def land
    fail "Unable to land: plane already landed" if landed_plane
    @airborne = false # when a plane lands, it is not airborne
  end 

  private

  def airborne_plane
    @airborne
  end 

  def landed_plane
    !@airborne
  end 


end 