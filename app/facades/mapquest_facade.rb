class MapquestFacade

  def self.get_latLng(city)
    latLng = MapquestService.location(city)
    latLng[:results].map do |place|
      Location.new(place[:locations].first)
    end
  end
end
