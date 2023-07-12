class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, :except => [:update]

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {data: user}, status: :ok
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user, status: :ok
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:full_name, :name, :email, :password, :password_confirmation, :avatar)
  end
end
