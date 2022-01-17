require 'rails_helper'

RSpec.describe 'Road Trip' do

  it 'calculates travel time between two locations', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    trip_params = { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: '9okGIqb8wPSdqlyOZhw2ngtt'}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

    expect(response.status).to eq(200)
    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]
    # require "pry"; binding.pry
    expect(parsed_data).to have_key(:attributes)
    expect(parsed_data[:attributes]).to be_a(Hash)
    expect(parsed_data[:attributes]).to have_key(:start_city)
    expect(parsed_data[:attributes][:start_city]).to be_a(String)
    expect(parsed_data[:attributes]).to have_key(:end_city)
    expect(parsed_data[:attributes][:end_city]).to be_a(String)
    expect(parsed_data[:attributes]).to have_key(:travel_time)
    expect(parsed_data[:attributes][:travel_time]).to be_a(String)
    expect(parsed_data[:attributes]).to have_key(:weather_at_eta)
    expect(parsed_data[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(parsed_data[:attributes][:weather_at_eta]).to have_key(:temp_at_eta)
    expect(parsed_data[:attributes][:weather_at_eta][:temp_at_eta]).to be_a(Float)
    expect(parsed_data[:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(parsed_data[:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
