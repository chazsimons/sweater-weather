require 'rails_helper'

RSpec.describe 'Logging In' do
  before :each do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    user_params = { email: 'johndoe123@gmail.com', password: 'password', password_confirmation: 'password' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    @user = User.last
  end

  it 'can log a user in' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    sign_in = { email: 'johndoe123@gmail.com', password: 'password' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(sign_in)

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(200)

    expect(parsed).to have_key(:attributes)
    expect(parsed[:attributes]).to be_a(Hash)
    expect(parsed[:attributes][:email]).to eq(sign_in[:email])
  end

  it 'returns an error if credentials are incorrect' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    bad_password = { email: 'johndoe123@gmail.com', password: 'bad_password' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(bad_password)

    parsed = JSON.parse(response.body, symbolize_names: true)[:errors]
    expect(response.status).to eq(400)
    expect(parsed[:details]).to eq('Sorry, your credentials are incorrect.')
  end
end
