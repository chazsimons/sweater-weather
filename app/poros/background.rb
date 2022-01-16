class Background
  attr_reader :location,
              :image_url,
              :credits

  def initialize(data)
    @location = data[:location][:title]
    @image_url = data[:urls][:raw]
    @credits = credit_generator(data)
  end

  def credit_generator(data)
    credit_hash = {}
    credit_hash[:source] = 'unsplash.com'
    credit_hash[:author] = data[:user][:username]
    credit_hash[:author_url] = data[:user][:links][:html]
    credit_hash
  end
end
