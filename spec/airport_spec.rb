require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new(5) } 
  let(:plane) { Plane.new }

  describe '#land' do

    it 'can land a plane at the airport' do
      expect(airport).to respond_to(:land).with(1).argument 
    end
    context 'when full' do
      it 'prevents a plane from landing' do
        airport.capacity.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Unable to land. Airport is full!"
      end 
    end 
  end 

  describe '#take_off' do
    it 'allows a plane to take off from the airport' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 
  end 

  describe 'default capacity' do
    it 'has a default capacity that can be overridden as appropriate' do
      test_airport = Airport.new
      Airport::DEFAULT_CAPACITY.times { test_airport.land(plane) }
      expect { test_airport.land(plane) }.to raise_error "Unable to land. Airport is full!"
    end 
  end 


end 