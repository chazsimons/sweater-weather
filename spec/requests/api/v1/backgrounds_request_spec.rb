require 'rails_helper'

RSpec.describe 'Backgrounds Request' do
  it 'can find an image of a location', :vcr do

    get '/api/v1/backgrounds?location=denver,co'

    photo_info = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful

    expect(photo_info).to have_key(:type)
    expect(photo_info[:type]).to eq('image')

    expect(photo_info).to have_key(:attributes)
    expect(photo_info[:attributes]).to be_a(Hash)
    attributes = photo_info[:attributes]

    expect(attributes).to have_key(:image)
    expect(attributes[:image]).to be_a(Hash)

    image_hash = attributes[:image]
    expect(image_hash).to have_key(:image_url)
    expect(image_hash[:image_url]).to be_a(String)

    expect(image_hash).to have_key(:credits)
    expect(image_hash[:credits]).to be_a(Hash)
    expect(image_hash).to have_key(:location)
    expect(image_hash[:location]).to be_a(String)

    credits_hash = image_hash[:credits]
    expect(credits_hash).to have_key(:author)
    expect(credits_hash[:author]).to be_a(String)
    expect(credits_hash).to have_key(:author_url)
    expect(credits_hash[:author_url]).to be_a(String)
    expect(credits_hash).to have_key(:source)
    expect(credits_hash[:author_url]).to be_a(String)
  end

  it 'does not send unnecessary data', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    photo_info = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful

    expect(photo_info).to_not have_key(:description)
    expect(photo_info).to_not have_key(:links)
    expect(photo_info).to_not have_key(:tags)
    expect(photo_info).to_not have_key(:total_collections)    
  end
end
