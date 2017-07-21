class SessionsController < ApplicationController
   
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{current_user.id}"
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
