class MapquestService
  def self.conn
    Faraday.new('http://www.mapquestapi.com/geocoding/v1/')
  end

  def self.location(city)
    response = conn.get("address") do |req|
        req.params[:key]      = ENV['mapquest_api_key']
        req.params[:location] =  city
      end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.route(origin, destination)
    response = Faraday.new('http://www.mapquestapi.com/directions/v2/').get('route') do |req|
      req.params[:key]  = ENV['mapquest_api_key']
      req.params[:from] = origin
      req.params[:to]   = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
