class BooksFacade

  def self.conn
    Faraday.new('https://openlibrary.org/subjects/')
  end

  def self.get_books_about(location, quantity)
    conn.get("#{location}?limit=#{quantity}")
  end
end
