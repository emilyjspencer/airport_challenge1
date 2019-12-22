require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new(Airport::DEFAULT_CAPACITY, weather) } 
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  describe '#land' do 
    it 'can land a plane at the airport' do
      allow(weather).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument 
    end
    context 'when full' do
      it 'prevents a plane from landing' do
        allow(weather).to receive(:stormy?).and_return false
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Unable to land. Airport is full!"
      end 
    end 
    context 'when stormy' do
      it 'prevents a plane from landing' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Unable to land due to stormy weather"
      end 
    end 
  end 

  describe '#take_off' do
    context 'when not stormy' do
      it 'allows a plane to take off from the airport' do
        allow(weather).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:take_off).with(1).argument
      end 
    end 
    context 'when stormy' do
      it 'prevents a plane from taking off' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Unable to take off due to stormy weather"
      end 
    end 
  end 
    describe 'default capacity' do
      it 'has a default capacity that can be overridden as appropriate' do
        allow(weather).to receive(:stormy?).and_return false 
        test_airport = Airport.new(weather)
        Airport::DEFAULT_CAPACITY.times { test_airport.land(plane) }
        expect { test_airport.land(plane) }.to raise_error "Unable to land. Airport is full!"
      end 
    end 
end 