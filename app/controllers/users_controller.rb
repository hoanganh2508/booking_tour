class UsersController < ApplicationController
  before_action :find_user , only: [:show, :edit, :update, :correct_user]
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.activated_user.paginate(page: params[:page])
  end

  def show
    redirect_to root_url and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user = image.attach(params[:user][:image])
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :image)
    end

    def find_user
      @user = User.find_by(id: params[:id])
      redirect_to root_path unless @user
    end

    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
end
