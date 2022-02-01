class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.create(user_params)
    respond_with(user)
  end

  private

  def user_params
    params.require(:user).permit(
        :password,
        :email,
        :login,
        :first_name,
        :last_name,
        :phone,
        :avatar
    )
  end


  def respond_with(user)
    if user.persisted?
      render json: {
          status: {code: 200, message: 'Signed up sucessfully.'}
      }
    else
      render json: user.errors.full_messages, status: :bad_request
    end
  end
  # def respond_with(resource, _opts = {})
  #   register_success && return if resource.persisted?
  #
  #   register_failed
  # end

  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end