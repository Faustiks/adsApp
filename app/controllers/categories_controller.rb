class CategoriesController < ApplicationController
  # show all Categories
  def index
    render json: Category.all
  end

  # show Category by id
  def show
    render json: Category.find(params[:id])
  end

  # create Category
  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors.full_messages, status: :unprocessable_entity
    end
  end

  # update Category
  def update
    category = Category.find(params[:id])
    category.update(category_update_params)
    if category.update(category_update_params)
      render json: category, status: 200
    else
      render json: category.errors.full_messages, status: :unprocessable_entity
    end
  end

  # delete Category
  def destroy
    Category.find(params[:id]).destroy!
    render json: {message: "category was delete"}, status: 200
  end

  private

  def category_update_params
    params.require(:category).permit(
        :name
    )
  end

  def category_params
    params.require(:category).permit(
        :name
    )
  end
end
