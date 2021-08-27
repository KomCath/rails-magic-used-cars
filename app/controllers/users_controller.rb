class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user - User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit; end

  def update; end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :admin,
      :password
    )
  end
end
