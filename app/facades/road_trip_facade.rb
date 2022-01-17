class RoadTripFacade

  def self.time_weather(origin, destination)
    route = MapquestService.route(origin, destination)
    trip = Trip.new(origin, destination, route)
    hourly_weather = WeatherService.get_weather_at_time(trip.lat, trip.lng)[:hourly]

    if trip.time_in_hrs > 48
      weather_at_time[:temp] = 'Forecast unavailable.'
    elsif trip.time_in_hrs < 0
      weather_at_time = hourly_weather[0]
    end
    
    weather_at_time = hourly_weather[(trip.time_in_hrs - 1)]

    trip_hash = {}
    trip_hash[:start_city]       = origin
    trip_hash[:end_city]         = destination
    trip_hash[:travel_time]      = trip.travel_time

    weather_at_eta = {}
    weather_at_eta[:temp_at_eta] = weather_at_time[:temp]
    weather_at_eta[:conditions]  = weather_at_time[:weather][0][:description]

    trip_hash[:weather_at_eta] = weather_at_eta
    trip_hash
  end
end
