class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :sign_in

  def current_user
    return if !session[:user_id].present?
    @current_user ||= User.find(session[:user_id])
    # debugger
  end 

  def signed_in?
    # debugger
    !current_user.nil?
  end 

  def require_login
    unless signed_in?
      flash[:warning] = "You must sign in to see this page!"
      redirect_to signin_path
    end 
  end 

  def skip_if_signed_in
    if signed_in?
      redirect_to users_path
    end 
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

end
