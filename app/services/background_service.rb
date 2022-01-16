class BackgroundService

  def self.conn
    Faraday.new('https://api.unsplash.com/')
  end

  def get_photo(city)
    conn.get('search/photos') do |req|
      req.params[:query]     = city
      req.params[:client_id] = ENV['unsplash_access_key']
    end
  end
end
