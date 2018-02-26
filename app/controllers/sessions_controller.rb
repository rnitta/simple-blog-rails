# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to(user)
    else
      @login_error = true
      render :new
    end
  end
end
