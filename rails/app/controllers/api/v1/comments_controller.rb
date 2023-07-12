class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: %i[create update destroy]

  def index
    comments = Comment.select('comments.*')
      .where('comments.recipe_id = ' + params[:recipe_id])
    render json: comments, status: :ok
  end

  def show
    comment = Comment.select('comments.*', 'users.name as user_name')
      .joins(:user)
      .where('comments.id = ' + params[:id])
      .first()
    render json: comment, status: :ok
  end

  def create
    comment = Comment.new(comment_params)
    # current user is the creator of the comment
    comment.user_id = current_user.id
    if comment.save
      render json: comment, status: :ok
    else
      render json: {errors: commment.errors}, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update_attributes(comment_params)
      render json: comment, status: :ok
    else
      render json: {errors: comment.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render status: :ok
    else
      render json: {errors: comment.errors}, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.permit(:user_id, :recipe_id, :commentBody)
  end
end
