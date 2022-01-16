class BackgroundsFacade

  def self.get_photo(city)
    response = BackgroundService.get_photo(city)
    Background.new(JSON.parse(response.body, symbolize_names: true))
  end
end
