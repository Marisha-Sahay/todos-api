class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      render :show
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

end