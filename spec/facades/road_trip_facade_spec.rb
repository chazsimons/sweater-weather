require 'rails_helper'

RSpec.describe 'Road Trip Facade' do
  before :each do
    @trip = RoadTripFacade.time_weather('denver,co', 'pueblo,co')
  end

  it 'returns a hash with travel information', :vcr do
    expect(@trip).to be_a(Hash)
    expect(@trip).to have_key(:start_city)
    expect(@trip[:start_city]).to eq('denver,co')
    expect(@trip).to have_key(:end_city)
    expect(@trip[:end_city]).to eq('pueblo,co')
    expect(@trip).to have_key(:travel_time)
    expect(@trip[:travel_time]).to be_a(String)
    expect(@trip).to have_key(:weather_at_eta)
    expect(@trip[:weather_at_eta]).to be_a(Hash)
    expect(@trip[:weather_at_eta]).to have_key(:temp_at_eta)
    expect(@trip[:weather_at_eta]).to have_key(:conditions)
    expect(@trip[:weather_at_eta][:temp_at_eta]).to be_a(Float)
    expect(@trip[:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'does not return unnecessary information', :vcr do
    expect(@trip).to_not have_key(:time)
    expect(@trip).to_not have_key(:icon)
  end

  it 'provides the next hours information if travel time is less than an hour', :vcr do
    short_trip = RoadTripFacade.time_weather('las vegas,nv', 'north las vegas,nv')

    expect(short_trip).to be_a(Hash)
    expect(@trip).to have_key(:start_city)
    expect(@trip[:start_city]).to eq('denver,co')
    expect(@trip).to have_key(:end_city)
    expect(@trip[:end_city]).to eq('pueblo,co')
    expect(@trip).to have_key(:travel_time)
    expect(@trip[:travel_time]).to be_a(String)
    expect(@trip).to have_key(:weather_at_eta)
    expect(@trip[:weather_at_eta]).to be_a(Hash)
    expect(@trip[:weather_at_eta]).to have_key(:temp_at_eta)
    expect(@trip[:weather_at_eta]).to have_key(:conditions)
    expect(@trip[:weather_at_eta][:temp_at_eta]).to be_a(Float)
    expect(@trip[:weather_at_eta][:conditions]).to be_a(String)
  end
end
