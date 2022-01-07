class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_review, only: [:create]
  before_action :correct_user, only: [:destroy]

  def create
    @comment = Comment.new comment_params
    @comment.review_id = @review.id
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Bình luận thành công"
    end
      redirect_to tour_path(@review.tour)
  end

  def destroy
    @comment.destroy
    flash[:success] = "Bình luận đã xóa"
    redirect_to tour_path(@comment.review.tour)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_review
      @review = Review.find_by id: params[:comment][:review_id]
      redirect_to tours_path unless @review
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to tour_path if @comment.nil?
    end
end
