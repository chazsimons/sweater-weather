require 'rails_helper'

RSpec.describe 'Users Request' do

  it 'creates a new user' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    user_params = { email: 'johndoe123@gmail.com', password: 'password', password_confirmation: 'password' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    new_user = User.last
    expect(new_user.email).to eq(user_params[:email])
  end

  it 'returns a 400 status if it cannot register a user' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    user_params = { email: 'johndoe123@gmail.com', password: 'password', password_confirmation: 'wrong_password' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    parsed = JSON.parse(response.body, symbolize_names: true)[:errors]

    expect(response.status).to eq(401)
    expect(parsed[:details]).to eq('Your passwords do not match. Please try again.')
  end

  it 'returns a 400 code if validations fail' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    user_params = { email: 'johndoe123@gmail.com', password: 'password', password_confirmation: 'password' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    user_2_params = { email: 'johndoe123@gmail.com', password: 'password', password_confirmation: 'password' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_2_params)

    parsed_errors = JSON.parse(response.body, symbolize_names: true)[:errors]

    expect(response.status).to eq(401)
    expect(parsed_errors[:details][:email][0]).to eq("has already been taken")
  end
end
