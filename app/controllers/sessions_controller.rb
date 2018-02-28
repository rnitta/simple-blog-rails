# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(user_params[:password])
      log_in(user)
      redirect_to(user)
    else
      @login_error = true
      render :new
    end
  end
  def destroy
    log_out
    redirect_to('/')
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
