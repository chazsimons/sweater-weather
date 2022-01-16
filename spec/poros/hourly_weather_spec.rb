require 'rails_helper'

RSpec.describe HourlyWeather do
  before :each do
    @weather = WeatherFacade.get_weather(36.169202, -115.140597)
  end

  it 'exists', :vcr do
    expect(@weather[:hourly_weather].first).to be_an_instance_of(HourlyWeather)
  end

  it 'has readable attributes', :vcr do
    expected = @weather[:hourly_weather].first

    expect(expected.time).to eq('Sat, 15 Jan 2022 14:00:00 -0800')
    expect(expected.tempature).to eq(59.32)
    expect(expected.conditions).to eq('clear sky')
    expect(expected.icon).to eq('01d')
  end
end
