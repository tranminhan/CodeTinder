class UsersController < ApplicationController
  before_action :require_login, only: [:index]
  before_action :skip_if_signed_in, only: [:create, :new]

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def show
  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else 
      render 'new'
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end 
end
