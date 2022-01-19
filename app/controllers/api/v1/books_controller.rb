class Api::V1::BooksController < ApplicationController

  def index
    lat_lng = MapquestFacade.get_latLng(params[:location])[0]
    current_weather = WeatherFacade.get_weather(lat_lng.lat, lat_lng.lng)[:current_weather]
    render json: BookSerializer.serialize(BooksFacade.get_books_about(params[:location],params[:quantity]), params[:location], current_weather)
  end
end
