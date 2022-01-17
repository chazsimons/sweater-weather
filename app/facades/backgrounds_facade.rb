class BackgroundsFacade

  def self.get_photo(city)
    # Rails.cache.fetch('background', :expires => 1.hour) do
      response = BackgroundService.get_photo(city)
      Background.new(JSON.parse(response.body, symbolize_names: true))
    # end
  end
end
