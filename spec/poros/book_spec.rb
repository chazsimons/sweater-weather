require 'rails_helper'

RSpec.describe Book do
  before :each do
    @books = BooksFacade.get_books_about('las vegas,nv', 1)
  end

  it 'exists', :vcr do
    expect(@books[:books].first).to be_a(Book)
  end

  it 'has readable attributes', :vcr do
    book = @books[:books].first
    expect(book.title).to be_a(String)
    expect(book.isbn).to be_a(Array)
    expect(book.publisher).to be_a(Array)
  end
end
