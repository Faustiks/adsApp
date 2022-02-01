class AdvertsController < ApplicationController
  before_action :authenticate_user!
  # show all Adverts
  def index
    render json: Advert.all
  end

  # show Advert by id
  def show
    # user = User.select("id, login").find(1)
    # user = User.select("id, login").find(params[:id])
    # user = User.find(5)
    advert = Advert.find(params[:id])
    user = User.select("id, login").find(advert.user_id)
    json_to_send = advert.as_json
    json_to_send[:user] = user.login
    # json_to_send[:user] = user
    render json: json_to_send
    # render json: Advert.find(params[:id])
  end

  # create Advert
  def create
    user = current_user
    advert = user.adverts.new(advert_params)
    if advert.save
      render json: advert, status: :created
    else
      render json: advert.errors.full_messages, status: :unprocessable_entity
    end
  end

  # update Advert
  def update
    advert = Advert.find(params[:id])
    advert.update(advert_update_params)
    if advert.update(advert_update_params)
      render json: advert, status: 200
    else
      render json: advert.errors.full_messages, status: :unprocessable_entity
    end
  end

  # delete Advert
  def destroy
    Advert.find(params[:id]).destroy!
    render json: {message: "Advert was delete"}, status: 200
  end

  private

  def advert_update_params
    params.require(:advert).permit(
        :title,
        :image,
        :description,
        :text
    )
  end

  def advert_params
    params.require(:advert).permit(
        :title,
        :image,
        :description,
        :text,
        :category_id
    )
  end
end
