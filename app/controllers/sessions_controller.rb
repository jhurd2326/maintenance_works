# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    authorized_user = User.authenticate(session_params[:username], session_params[:password])
    if authorized_user
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
