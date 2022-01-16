class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.create!(user_params)
      render json: UserSerializer.new(@user), status: 201
    else
      render json: {errors: { details: 'Your passwords do not match. Please try again.'}}, status: 400
    end
  end

  private

  def user_params
    params[:api_key] = SecureRandom.base64.tr('+/=', 'Qrt')
    params[:email] = params[:email].downcase
    params.permit(:email, :password, :api_key)
  end
end
