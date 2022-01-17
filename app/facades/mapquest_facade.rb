class MapquestFacade

  def self.get_latLng(city)
    latLng = MapquestService.location(city)
    latLng[:results].map do |place|
      Location.new(place[:locations].first)
    end
  end

  def self.trip_time(origin, destination)
    trip = MapquestService.route(origin, destination)
    Trip.new(origin, destination, trip)
  end
end
