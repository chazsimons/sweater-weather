class BooksService

  def self.conn
    Faraday.new('https://openlibrary.org/search.json')
  end

  def self.get_books_about(location, quantity)
    response = conn.get("?q=#{location.slice(0..-4)}&limit=#{quantity}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
