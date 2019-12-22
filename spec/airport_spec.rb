require 'airport'

describe Airport do
  let(:airport) { Airport.new } 

  it 'can land a plane at the aiport' do
    expect(airport).to respond_to(:land).with(1).argument 
  end 


end 