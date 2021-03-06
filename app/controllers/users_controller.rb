require 'byebug'
class UsersController < ApplicationController
  
  def index
    debugger
    if params[:user_id]
      render json: User.
    else
     render json: User.all
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end

