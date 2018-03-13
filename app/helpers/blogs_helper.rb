# frozen_string_literal: true

module BlogsHelper
  def authorized?(blog)
    blog.user_id == current_user&.id
  end
end
