require 'rails_helper'

RSpec.describe 'Users Request' do

  it 'creates a new user' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    user_params = { email: 'johndoe123@gmail.com', password: 'password', password_confirmation: 'password' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

  end
end
