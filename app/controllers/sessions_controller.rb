# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i(new create)

  def new
    redirect_to home_path if logged_in?
  end

  def create
    authorized_user = User.authenticate(session_params[:username], session_params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to home_path
    else
      flash.now.alert = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
