class MapquestFacade

  def self.get_latLng(city)
    # Rails.cache.fetch('mapquest', :expires => 1.hour) do
      latLng = MapquestService.location(city)
      latLng[:results].map do |place|
        Location.new(place[:locations].first)
      end
    # end
  end
end
