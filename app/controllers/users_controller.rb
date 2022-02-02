class UsersController < ApplicationController
  before_action :authenticate_user!,
                only: [:index, :show, :destroy, :update]
  # show all users
  def index
    render json: User.all
  end

  # show user by id
  def show
    render json: User.find(params[:id])
  end

  # create user
  # def create
  #   user = User.new(user_params)
  #
  #   if user.save
  #     render json: user, status: :created
  #   else
  #     render json: user.errors.full_messages, status: :unprocessable_entity
  #   end
  # end

  # update user
  def update
    user = User.find(params[:id])
    user.update(user_update_params)
    if user.update(user_update_params)
      render json: user, status: 200
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # delete user
  def destroy
    User.find(params[:id]).destroy!
    render json: {message: "user was delete"}, status: 200
  end

  private
  def user_update_params
    params.require(:user).permit(
        :password,
        :first_name,
        :last_name,
        :email,
        :phone,
        :avatar
    )
  end

  # def user_params
  #   params.require(:user).permit(
  #     :login,
  #     :password,
  #     :first_name,
  #     :last_name,
  #     :email,
  #     :phone,
  #     :avatar
  #   )
  # end

end
