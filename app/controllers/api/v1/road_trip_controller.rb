class Api::V1::RoadTripController < ApplicationController

  def create
    if correct_key == true
      render json: RoadTripSerializer.serialize(RoadTripFacade.time_weather(params[:origin], params[:destination]))
    else
      render json: {errors: { details: 'Sorry, your credentials are incorrect.'}}, status: 401
    end
  end

  private

  def correct_key
    if params[:api_key].present?
      user = User.find_by(api_key: params[:api_key])
      true if !user.nil?
    else
      false
    end
  end
end
