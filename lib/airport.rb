require_relative 'weather'

class Airport
  attr_accessor :capacity 
  
  DEFAULT_CAPACITY = 3 

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity 
    @weather = weather
    @planes = []
  end 

  def land(plane)
    fail "Unable to land. Airport is full!" if full? 
    fail "Unable to land due to stormy weather" if stormy?
    @planes.push(plane)
  end 

  def take_off(plane)
    fail "Unable to take off due to stormy weather" if stormy?
    @planes.pop
  end 


  private 

  def full? 
    @planes.count >= @capacity
  end 

  def stormy?
    @weather.stormy?
  end 

end 