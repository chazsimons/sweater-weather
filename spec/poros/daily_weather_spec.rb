require 'rails_helper'

RSpec.describe DailyWeather do
  before :each do
    @weather = WeatherFacade.get_weather(36.169202, -115.140597)
  end

  it 'exists', :vcr do
    expect(@weather[:daily_weather].first).to be_an_instance_of(DailyWeather)
  end

  it 'has readable attributes', :vcr do
    expected = @weather[:daily_weather][1]

    expect(expected.date).to eq('Sun, 16 Jan 2022 11:00:00 -0800')
    expect(expected.sunrise).to eq('Sun, 16 Jan 2022 06:50:22 -0800')
    expect(expected.sunset).to eq('Sun, 16 Jan 2022 16:49:57 -0800')
    expect(expected.max_temp).to eq(60.15)
    expect(expected.min_temp).to eq(45.39)
    expect(expected.conditions).to eq("broken clouds")
    expect(expected.icon).to eq('04d')
  end
end
