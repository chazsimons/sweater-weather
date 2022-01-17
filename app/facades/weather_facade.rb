class WeatherFacade
  def self.get_weather(lat, lng)
    # Rails.cache.fetch('weather', :expires => 1.hour) do
      weather = WeatherService.get_weather(lat, lng)

      current = CurrentWeather.new(weather[:current])

      daily = weather[:daily].map do |day|
        DailyWeather.new(day)
      end[0..4]

      hourly = weather[:hourly].map do |hour|
        HourlyWeather.new(hour)
      end[0..7]

      weather_hash = Hash.new
      weather_hash[:current_weather] = current
      weather_hash[:daily_weather] = daily
      weather_hash[:hourly_weather] = hourly
      weather_hash
    # end
  end
end
