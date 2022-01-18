require 'rails_helper'

RSpec.describe BooksFacade do
  it 'returns the correct attributes of searched books', :vcr do
    books = BooksFacade.get_books_about('denver,co', 5)
    expect(books[:books].first).to be_a(Book)
    expect(books[:books].first.title).to be_a(String)
    expect(books[:books].first.isbn).to be_a(Array)
    expect(books[:books].first.publisher).to be_a(Array)
  end

  it 'returns the total number of results', :vcr do
    books = BooksFacade.get_books_about('denver,co', 5)

    expect(books[:total_books_found]).to be_a(Integer)
    expect(books[:total_books_found]).to be > (5)
  end
end
