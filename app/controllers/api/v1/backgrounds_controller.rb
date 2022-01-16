class Api::V1::BackgroundsController < ApplicationController

  def index
    render json: {data: { id: 'null', type: 'image', attributes: {  image: BackgroundsFacade.get_photo(params[:location]) }}}
  end
end
