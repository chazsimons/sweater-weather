class Api::V1::BooksController < ApplicationController

  def index
    lat_lng = MapquestFacade.get_latLng(params[:location])[0]
    current_weather = WeatherFacade.get_weather(lat_lng.lat, lat_lng.lng)[:current_weather]
    render json: { data:
                  { id: 'null', type: 'books',
                    attributes: {
                      desination: params[:location],
                      forecast: {
                        summary: current_weather.conditions,
                        temperature: current_weather.temp },
                        total_books_found: BooksFacade.get_books_about(params[:location], params[:quantity])[:total_books_found],
                        books: BooksFacade.get_books_about(params[:location], params[:quantity])[:books]}}}
  end
end
