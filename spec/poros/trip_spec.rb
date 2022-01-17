require 'rails_helper'

RSpec.describe Trip do
  before :each do
    @route = MapquestService.route('denver,co', 'pueblo,co')
    @impossible_route = MapquestService.route('denver,co', 'london')
    @trip = Trip.new('denver,co', 'pueblo,co', @route)
    @impossible_trip = Trip.new('denver,co', 'london', @impossible_route)
  end

  it 'has readable attributes', :vcr do
    expect(@trip.travel_time).to eq("01:45:23")
    expect(@trip.lat).to eq(39.738453)
    expect(@trip.lng).to eq(-104.987602)
    expect(@trip.start_city).to eq('denver,co')
    expect(@trip.end_city).to eq('pueblo,co')
    expect(@trip.time_in_hrs).to eq(1)
  end

  it 'has different attributes for impossible routes', :vcr do
    expect(@impossible_trip.travel_time).to eq('We are unable to route with the given locations.')
    expect(@impossible_trip.lat).to eq(0.000000)
    expect(@impossible_trip.lng).to eq(0.000000)
    expect(@impossible_trip.start_city).to eq('denver,co')
    expect(@impossible_trip.end_city).to eq('london')
    expect(@impossible_trip.time_in_hrs).to eq(1000)
  end
end
