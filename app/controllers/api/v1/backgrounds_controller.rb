class Api::V1::BackgroundsController < ApplicationController

  def index
    render json: BackgroundSerializer.serialize(BackgroundsFacade.get_photo(params[:location]))
  end
end
