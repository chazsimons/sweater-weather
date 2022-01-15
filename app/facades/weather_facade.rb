class WeatherFacade
  def self.get_weather(lat, lng)
    weather = WeatherService.get_weather(lat, lng)

    current = CurrentWeather.new(weather[:current])

    daily = weather[:daily].map do |day|
      DailyWeather.new(day)
    end[0..4]

    hourly = weather[:hourly].map do |hour|
      HourlyWeather.new(hour)
    end[0..7]

    weather_hash = Hash.new
    weather_hash[:current] = current
    weather_hash[:daily] = daily
    weather_hash[:hourly] = hourly
    weather_hash
  end
end
