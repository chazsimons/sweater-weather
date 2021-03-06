class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: {errors: { details: 'Sorry, your credentials are incorrect.'}}, status: 401
    end
  end
end
