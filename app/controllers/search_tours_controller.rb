class SearchToursController < ApplicationController
  def index
    @tours = Tour.search(params[:search])
  end
end
