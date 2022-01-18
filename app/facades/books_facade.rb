class BooksFacade

  def self.get_books_about(location, quantity)
    books = BooksService.get_books_about(location, quantity)
    books_hash = {}
    books_hash[:books] = books[:docs].map do |book|
      Book.new(book)
    end
    books_hash[:total_books_found] = books[:numFound]
    books_hash
  end
end
