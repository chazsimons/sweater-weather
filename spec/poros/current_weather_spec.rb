require 'rails_helper'

RSpec.describe CurrentWeather do
  before :each do
    @weather = WeatherFacade.get_weather(36.169202, -115.140597)
  end

  it 'exists', :vcr do
    expect(@weather[:current]).to be_an_instance_of(CurrentWeather)
  end

  it 'has readable attributes', :vcr do
    expected = @weather[:current]

    expect(expected.sunrise).to eq('Sat, 15 Jan 2022 06:50:41 -0800')
    expect(expected.sunset).to eq('Sat, 15 Jan 2022 16:48:57 -0800')
    expect(expected.temp).to eq(59.2)
    expect(expected.feels_like).to eq(55.94)
    expect(expected.uvi).to eq(1.4)
    expect(expected.visibility).to eq(10000)
    expect(expected.conditions).to eq("clear sky")
    expect(expected.icon).to eq('01d')
  end
end
