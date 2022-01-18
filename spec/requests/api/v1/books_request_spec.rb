require 'rails_helper'

RSpec.describe 'Books Request' do

  it 'returns books given a location', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed).to have_key(:id)
    expect(parsed[:id]).to eq('null')
    expect(parsed).to have_key(:type)
    expect(parsed[:type]).to eq('books')
    expect(parsed).to have_key(:attributes)
    expect(parsed[:attributes]).to be_a(Hash)

    attributes = parsed[:attributes]
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to be_a(Hash)
    expect(attributes[:forecast]).to have_key(:temperature)
    expect(attributes[:forecast][:temperature]).to be_a(Float)
    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast][:summary]).to be_a(String)
    expect(attributes[:forecast]).to_not have_key(:sunrise)
    expect(attributes[:forecast]).to_not have_key(:sunset)
    expect(attributes[:forecast]).to_not have_key(:uvi)
    expect(attributes[:forecast]).to_not have_key(:humidity)
    expect(attributes).to have_key(:total_books_found)
    expect(attributes[:total_books_found]).to be_a(Integer)
    expect(attributes).to have_key(:books)
    expect(attributes[:books]).to be_a(Array)

    attributes[:books].each do |book|
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_a(Array)
      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_a(Array)
      expect(book).to_not have_key(:type)
      expect(book).to_not have_key(:first_publish_year)
      expect(book).to_not have_key(:edition_count)
    end
  end
end
