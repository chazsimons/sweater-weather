class BooksFacade

  def self.get_books_about(location, quantity)
    books = BooksService.get_books_about(location, quantity)
    total_books = books[:work_count]
    books[:works].map do |book|
      Book.new(book)
    end
  end
end
