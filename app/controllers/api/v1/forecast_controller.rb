class Api::V1::ForecastController < ApplicationController

  def index
    lat_lng = MapquestFacade.get_latLng(params[:location])[0]
    render json: {data: { id: 'null', type: 'forecast', attributes: WeatherFacade.get_weather(lat_lng.lat, lat_lng.lng)}}
  end
end
