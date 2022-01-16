class Api::V1::BackgroundsController < ApplicationController

  def index
    render json: { data: { type: 'image', id: 'null', attributes: { image: { BackgroundsFacade.get_photo(params[:location])}}}}
  end
end
