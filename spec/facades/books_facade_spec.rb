require 'rails_helper'

RSpec.describe BooksFacade do
  it 'returns the correct attributes of searched books', :vcr do
    books = BooksFacade.get_books_about('denver,co', 5)
    
    expect(books.first).to be_a(Book)
  end
end
