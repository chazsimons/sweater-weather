require 'rails_helper'

RSpec.describe BackgroundService do
  it 'establishes a Faraday connection', :vcr do
    expect(BackgroundService.conn).to be_a(Faraday::Connection)
  end

  it 'returns information for a image from a search', :vcr do
    response = BackgroundService.get_photo('denver,co')
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:urls)
    expect(parsed[:urls]).to be_a(Hash)
    expect(parsed).to have_key(:alt_description)
    expect(parsed).to have_key(:width)
    expect(parsed[:width]).to be_a(Integer)
    expect(parsed).to have_key(:height)
    expect(parsed[:height]).to be_a(Integer)
  end
end
