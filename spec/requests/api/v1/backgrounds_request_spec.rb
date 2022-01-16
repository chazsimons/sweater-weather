require 'rails_helper'

RSpec.describe 'Backgrounds Request' do
  it 'can find an image of a location' do

    get '/api/v1/backgrounds?location=denver,co'

    require "pry"; binding.pry
  end
end
