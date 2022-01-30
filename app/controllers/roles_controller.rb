class RolesController < ApplicationController
  # show all roles
  def index
    render json: Role.all
  end

  # show role by id
  def show
    render json: Role.find(params[:id])
  end

  # create role
  # def create
  #   role = Role.new(role_params)
  #   if role.save
  #     render json: role, status: :created
  #   else
  #     render json: role.errors, status: :unprocessable_entity
  #   end
  # end

  # delete role
  # def destroy
  #   Role.find(params[:id]).destroy!
  #   render json: {message: "role was delete"}, status: 200
  # end
  #
  # private
  #
  # def role_params
  #   params.require(:role).permit(
  #       :name
  #   )
  # end
end
