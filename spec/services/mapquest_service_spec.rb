require 'rails_helper'

RSpec.describe MapquestService do
  it 'establishes a Faraday connection', :vcr do
    expect(MapquestService.conn).to be_a(Faraday::Connection)
  end

  it 'returns the latitude & longitude of a city', :vcr do
    response = MapquestService.location('Las Vegas, NV')

    response[:results].each do |location|
      expect(location[:locations].first).to have_key(:latLng)
      expect(location[:locations].first[:latLng]).to be_a(Hash)
      expect(location[:locations].first[:latLng]).to have_key(:lat)
      expect(location[:locations].first[:latLng][:lat]).to be_a(Float)
      expect(location[:locations].first[:latLng]).to have_key(:lng)
      expect(location[:locations].first[:latLng][:lng]).to be_a(Float)
    end
  end
end
