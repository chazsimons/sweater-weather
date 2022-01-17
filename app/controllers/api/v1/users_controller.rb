class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        render json: UserSerializer.new(@user), status: 201
      else
        render json: {errors: {details: @user.errors }}, status: 401
      end
    else
      render json: {errors: { details: 'Your passwords do not match. Please try again.'}}, status: 401
    end
  end

  private

  def user_params
    params[:api_key] = SecureRandom.base64.tr('+/=', 'Qrt')
    params[:email] = params[:email].downcase
    params.permit(:email, :password, :api_key)
  end
end
