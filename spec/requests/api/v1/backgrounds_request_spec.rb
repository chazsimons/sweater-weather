require 'rails_helper'

RSpec.describe 'Backgrounds Request' do
  it 'can find an image of a location', :vcr do

    get '/api/v1/backgrounds?location=denver,co'
  end
end
