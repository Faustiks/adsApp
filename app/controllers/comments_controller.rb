class CommentsController < ApplicationController
  # show all comments
  def index
    render json: Comment.all
  end

  # show comment by id
  def show
    render json: Comment.find(params[:id])
  end

  # create comment
  def create

    # user = User.find(5)
    # advert = user.adverts.new(advert_params)
    # if advert.save
    #   render json: advert, status: :created
    # else
    #   render json: advert.errors.full_messages, status: :unprocessable_entity
    # end
    # user = User.find(5)
    # advert = user.adverts.new(advert_params)
    #
    # advert = Advert.find(params[:id])
    # user = User.select("id, login").find(advert.user_id)
    # json_to_send = advert.as_json
    # json_to_send[:user] = user.login
    # # json_to_send[:user] = user
    # render json: json_to_send

    # comment = User.find(5).
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  # delete comment
  def destroy
    Comment.find(params[:id]).destroy!
    render json: {message: "comment was delete"}, status: 200
  end

  private

  def comment_params
    params.require(:comment).permit(
        :text
    )
  end
end
