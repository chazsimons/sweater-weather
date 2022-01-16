require 'rails_helper'

RSpec.describe WeatherFacade do
  before :each do
    @weather = WeatherFacade.get_weather(39.526903, -119.813283)
  end

  it 'return a hash weather poros', :vcr do
    expect(@weather[:current_weather]).to be_an_instance_of(CurrentWeather)
    expect(@weather[:daily_weather].first).to be_an_instance_of(DailyWeather)
    expect(@weather[:hourly_weather].first).to be_an_instance_of(HourlyWeather)
  end

  it 'only returns 5 days of forecasted weather', :vcr do
    expect(@weather[:daily_weather].count).to eq(5)
  end

  it 'only returns 8 hours of daily forecast', :vcr do
    expect(@weather[:hourly_weather].count).to eq(8)
  end
end
