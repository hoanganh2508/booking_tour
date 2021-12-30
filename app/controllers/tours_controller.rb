class ToursController < ApplicationController
  before_action :find_tour , only: [:show]
  def index
    @categories = Category.all
  end

  def show
    @user_tour = UserTour.new
    @same_tours = Tour.same_location(@tour.address)
    @reviews = @tour.reviews.order(created_at: :desc)
                    .paginate(page: params[:page], per_page: 5)
  end

  private
    def find_tour
      @tour = Tour.find_by(id: params[:id])
      redirect_to root_path unless @tour
    end
end
