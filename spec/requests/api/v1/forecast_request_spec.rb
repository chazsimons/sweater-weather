require 'rails_helper'

RSpec.describe 'forecast requests' do
  it 'can return forecast for a given city', :vcr do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(forecast[:current_weather]).to have_key(:datetime)
    expect(forecast[:current_weather]).to have_key(:sunrise)
    expect(forecast[:current_weather]).to have_key(:sunset)
    expect(forecast[:current_weather]).to have_key(:temp)
    expect(forecast[:current_weather]).to have_key(:feels_like)
    expect(forecast[:current_weather]).to have_key(:humidity)
    expect(forecast[:current_weather]).to have_key(:uvi)
    expect(forecast[:current_weather]).to have_key(:visibility)
    expect(forecast[:current_weather]).to have_key(:conditions)
    expect(forecast[:current_weather]).to have_key(:icon)
    expect(forecast[:current_weather]).to_not have_key(:dew_point)
    expect(forecast[:current_weather]).to_not have_key(:pressure)
    expect(forecast[:current_weather]).to_not have_key(:clouds)

    daily = forecast[:daily_weather]

    daily.each do |day|
      expect(day).to have_key(:date)
      expect(day).to have_key(:sunrise)
      expect(day).to have_key(:sunset)
      expect(day).to have_key(:max_temp)
      expect(day).to have_key(:min_temp)
      expect(day).to have_key(:conditions)
      expect(day).to have_key(:icon)
      expect(day).to_not have_key(:moonrise)
      expect(day).to_not have_key(:moonset)
      expect(day).to_not have_key(:feels_like)
    end

    hourly = forecast[:hourly_weather]

    hourly.each do |hour|
      expect(hour).to have_key(:time)
      expect(hour).to have_key(:tempature)
      expect(hour).to have_key(:conditions)
      expect(hour).to have_key(:icon)
      expect(hour).to_not have_key(:feels_like)
      expect(hour).to_not have_key(:pressure)
      expect(hour).to_not have_key(:dew_point)
      expect(hour).to_not have_key(:visibility)
    end
  end
end
