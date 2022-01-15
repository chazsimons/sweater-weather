require 'rails_helper'

RSpec.describe WeatherFacade do
  before :each do
    @weather = WeatherFacade.get_weather(39.526903, -119.813283)
  end

  it 'return a hash weather poros', :vcr do
    expect(@weather[:current]).to be_an_instance_of(CurrentWeather)
    expect(@weather[:daily].first).to be_an_instance_of(DailyWeather)
    expect(@weather[:hourly].first).to be_an_instance_of(HourlyWeather)
  end

  it 'only returns 5 days of forecasted weather', :vcr do
    expect(@weather[:daily].count).to eq(5)
  end

  it 'only returns 8 hours of daily forecast', :vcr do
    expect(@weather[:hourly].count).to eq(8)
  end
end
