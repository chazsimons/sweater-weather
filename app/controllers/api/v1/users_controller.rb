class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user), status: 201
    else
      render json: {errors: { details: 'Your credentials are incorrect. Please try again!'}}, status: 400
    end
  end

  private

  def user_params
    params[:api_key] = SecureRandom.base64.tr('+/=', 'Qrt')
    params[:email] = params[:email].downcase
    params.permit(:email, :password, :api_key)
  end
end
