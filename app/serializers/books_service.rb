class BooksService

  def self.conn
    Faraday.new('https://openlibrary.org/subjects/')
  end

  def self.get_books_about(location, quantity)
    response = conn.get("#{location.slice(0..-4)}.json?limit=#{quantity}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
