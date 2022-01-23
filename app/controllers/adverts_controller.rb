class AdvertsController < ApplicationController
  def index
    render json: Advert.all
  end
end
