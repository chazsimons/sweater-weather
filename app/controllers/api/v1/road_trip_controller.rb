class Api::V1::RoadTripController < ApplicationController

  def create
    render json: { data: { id: 'null', type: 'roadtrip', attributes: RoadTripFacade.time_weather(params[:origin], params[:destination]) } }
  end
end
