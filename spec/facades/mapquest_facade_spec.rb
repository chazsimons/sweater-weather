require 'rails_helper'

RSpec.describe MapquestFacade do

  it 'return a location poro', :vcr do
    location = MapquestFacade.get_latLng('Reno,Nv')

    expect(location.first).to be_an_instance_of(Location)
  end

  it 'returns a object with latitude and longitude', :vcr do
    location = MapquestFacade.get_latLng('Reno,Nv')

    expect(location.first.lat).to eq(39.526903)
    expect(location.first.lng).to eq(-119.813283)
  end
end
