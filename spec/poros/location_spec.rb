require 'rails_helper'

RSpec.describe Location do
  before :each do
    @location = MapquestFacade.get_latLng("Las Vegas,Nv")
  end

  it 'exists', :vcr do
    expect(@location.first).to be_a(Location)
  end

  it 'has readable attributes', :vcr do
    expect(@location.first.lat).to eq(36.169202)
    expect(@location.first.lng).to eq(-115.140597)
  end
end
