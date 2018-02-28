# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  def logged_in?
    !current_user.nil?
  end
  def require_login
    redirect_to(login_path) if current_user.nil?
  end
end
