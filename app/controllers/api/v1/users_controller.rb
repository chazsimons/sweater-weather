class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(params)
  end
end
