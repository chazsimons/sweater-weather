class BackgroundService

  def self.conn
    Faraday.new('https://api.unsplash.com/')
  end

  def self.get_photo(city)
    conn.get('photos/random') do |req|
      req.params[:query]       = city
      req.params[:client_id]   = ENV['unsplash_access_key']
      req.params[:orientation] = 'landscape'
      req.params[:page]        = 1
      req.params[:per_page]    = 1
    end
  end
end
