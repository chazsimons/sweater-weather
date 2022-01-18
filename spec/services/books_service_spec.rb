require 'rails_helper'

RSpec.describe BooksService do

  it 'can establish a Faraday connection' do
    expect(BooksService.conn).to be_a(Faraday::Connection)
  end

  it 'can find books about a certain subject', :vcr do
    books = BooksService.get_books_about('denver,co', 5)

    expect(books).to have_key(:name)
    expect(books[:name]).to eq('denver')
    expect(books).to have_key(:work_count)
    expect(books[:work_count]).to be_a(Integer)
    expect(books).to have_key(:works)
    expect(books[:works]).to be_a(Array)
  end

  it 'only returns the specified quantity of books', :vcr do
    books = BooksService.get_books_about('denver,co', 5)

    expect(books[:works].count).to eq(5)
  end
end
