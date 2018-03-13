# frozen_string_literal: true

module BlogsHelper
  def authorized?(blog)
    if current_user.nil?
      redirect_to(login_path)
    else
      blog.user_id == current_user.id
    end
  end
end
