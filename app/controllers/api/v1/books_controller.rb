class Api::V1::BooksController < ApplicationController

  def index
    # require "pry"; binding.pry
    BooksFacade.get_books_about(params[:location], params[:quantity])
  end
end
