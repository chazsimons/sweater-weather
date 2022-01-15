class WeatherService
  def self.conn
    Faraday.new('https://api.openweathermap.org/data/2.5/')
  end

  def self.get_weather(lat, lng)
    response = conn.get('onecall') do |req|
      req.params[:appid] = ENV['open_weather_api']
      req.params[:lat] = lat
      req.params[:lon] = lng
      req.params[:units] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
