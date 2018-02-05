# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = user_params[:password]
    if user_params[:password].length > 6 && @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
