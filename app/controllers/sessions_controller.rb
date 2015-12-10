class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome to Tinder, #{user.name}!"
      redirect_to users_path
    else 
      flash[:warning] = "Username and password are incorrect"
      render 'new'
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "See you again!"
    redirect_to root_path
  end 
end
