require 'rails_helper'

RSpec.describe BooksService do

  it 'can establish a Faraday connection' do
    expect(BooksService.conn).to be_a(Faraday::Connection)
  end

  it 'can find books about a certain subject', :vcr do
    books = BooksService.get_books_about('denver,co', 5)
    
    books[:docs].each do |doc|
      expect(doc).to have_key(:title)
      expect(doc[:title]).to be_a(String)
      expect(doc).to have_key(:isbn)
      expect(doc[:isbn]).to be_a(Array)
      expect(doc).to have_key(:publisher)
      expect(doc[:publisher]).to be_a(Array)
    end
  end

  it 'only returns the specified quantity of books', :vcr do
    books = BooksService.get_books_about('denver,co', 5)

    expect(books[:docs].count).to eq(5)
  end
end
