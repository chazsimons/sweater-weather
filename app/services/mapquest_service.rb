class MapquestService
  def self.conn
    Faraday.new('http://www.mapquestapi.com/geocoding/v1/')
  end

  def self.location(city)
    response = conn.get("address") do |req|
        req.params[:key] = ENV['mapquest_api_key']
        req.params[:location] =  city
      end
    JSON.parse(response.body, symbolize_names: true)
  end
end
