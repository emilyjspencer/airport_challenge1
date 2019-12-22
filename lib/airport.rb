class Airport
  attr_accessor :capacity 
  
  DEFAULT_CAPACITY = 3 

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = []
  end 

  def land(plane)
    fail "Unable to land. Airport is full!" if full? 
    @planes.push(plane)
  end 

  def take_off(plane)
    @planes.pop
  end 


  private 

  def full? 
    @planes.count >= @capacity
  end 

end 