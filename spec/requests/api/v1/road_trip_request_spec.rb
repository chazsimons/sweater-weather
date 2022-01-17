require 'rails_helper'

RSpec.describe 'Road Trip' do
  before :each do
    @user = User.create!({ email: 'johndoe123@gmail.com', password: 'password', api_key: '9okGIqb8wPSdqlyOZhw2ngtt' })
  end

  it 'calculates travel time and forecast between two locations', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    trip_params = { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: '9okGIqb8wPSdqlyOZhw2ngtt'}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

    expect(response.status).to eq(200)
    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

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

  it 'returns an error if API key is invalid or absent', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    invalid_api_params = { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: '9okGIqb8wPSdqlyOZhw'}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(invalid_api_params)

    expect(response.status).to eq(401)
    parsed_errors = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_errors).to have_key(:errors)
    expect(parsed_errors[:errors]).to have_key(:details)
    expect(parsed_errors[:errors][:details]).to eq("Sorry, your credentials are incorrect.")

    headers = { 'CONTENT_TYPE' => 'application/json' }
    no_api_params = { origin: 'Denver,CO', destination: 'Pueblo,CO'}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(no_api_params)

    expect(response.status).to eq(401)
    parsed_errors = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_errors).to have_key(:errors)
    expect(parsed_errors[:errors]).to have_key(:details)
    expect(parsed_errors[:errors][:details]).to eq("Sorry, your credentials are incorrect.")
  end

  it 'returns an error if the travel time is impossible', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    trip_params = { origin: 'Denver,CO', destination: 'London', api_key: '9okGIqb8wPSdqlyOZhw2ngtt'}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

    expect(response.status).to eq(200)
    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data).to have_key(:attributes)
    expect(parsed_data[:attributes]).to be_a(Hash)
    expect(parsed_data[:attributes][:travel_time]).to eq('We are unable to route with the given locations.')
  end
end
