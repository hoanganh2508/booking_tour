class Admin::CategoriesController < Admin::AdminController
  before_action :find_category , only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Tạo thành công"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category updated"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Xoá category"
    redirect_to admin_categories_path
  end

  private
  def find_category
    @category = Category.find_by(id: params[:id])
    redirect_to admin_categories_path unless @category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
