class MyToursController < ApplicationController
  def index
    @user_tours = current_user.user_tours
  end
end
