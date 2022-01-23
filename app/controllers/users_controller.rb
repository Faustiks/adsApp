class UsersController < ApplicationController
  # show all users
  def index
    render json: User.all
  end

  # show user by id
  def show
    render json: User.find(params[:id])
  end

  # create user
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
        :role_id,
        :login,
        :password,
        :first_name,
        :last_name,
        :email,
        :phone,
        :avatar
    )
  end

end
