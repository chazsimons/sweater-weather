require 'rails_helper'

RSpec.describe 'Books Request' do

  it 'returns books given a location', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end
