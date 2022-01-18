require 'rails_helper'

RSpec.describe BooksFacade do
  it 'returns the correct attributes of searched books', :vcr do
    books = BooksFacade.get_books_about('denver,co', 5)

    expect(books.first).to be_a(Book)
    expect(books.first.title).to be_a(String)
    expect(books.first.isbn).to be_a(String)
    expect(books.first.publisher).to be_a(String)
  end
end
