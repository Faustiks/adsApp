class CommentsController < ApplicationController
  # show all comments
  # def index
  #   render json: Comment.all
  # end

  # show comment by id
  def show
    render json: Comment.find(params[:id])
  end

  # create comment
  def create
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
