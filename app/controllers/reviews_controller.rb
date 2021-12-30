class ReviewsController < ApplicationController
   before_action :logged_in_user, only: [:create]
   before_action :set_tour, only: [:create, :new, :destroy, :edit, :update]
   before_action :find_review, only: [:edit, :destroy, :update]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
    @review.tour_id = @tour.id
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Tạo thành công"
      redirect_to tour_path(@tour)
    else
      render 'new'
    end
  end

  def edit
    redirect_to @tour unless @review
  end

  def update
    if @review.update(review_params)
      flash[:success] = "Bài đánh giá cập nhật thành công"
      redirect_to tour_path(@tour)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Đã xóa đánh giá"
    redirect_to tour_path(@tour)
  end

  private

  def find_review
    @review = Review.find_by(id: params[:id])
    redirect_to tour_path(@tour) unless @review
  end

  def set_tour
    @tour = Tour.find_by id: params[:tour_id]
    redirect_to tours_path unless @tour
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
