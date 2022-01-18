class BooksFacade

  def self.get_books_about(location, quantity)
    books = BooksService.get_books_about(location, quantity)
    total_books_found = books[:numFound]
    books[:docs].map do |book|
      Book.new(book)
    end
  end
end
