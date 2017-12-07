# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  helper_method :logged_in?
  helper_method :current_user

  def authorize
    return if logged_in?
    redirect_to login_path, notice: "Please Login"
  end

  def logged_in?
    return true if current_user
    false
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
