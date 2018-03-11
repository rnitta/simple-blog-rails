# frozen_string_literal: true

class BlogsController < ApplicationController
  require 'securerandom'
  include BlogsHelper
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :update, :destroy]
  def show
  end

  def new
    if current_user.blogs.empty?
      @blog = Blog.new
      @blog.name = SecureRandom.hex(8)
      @blog.title = current_user.name + 'のブログ'
      @blog.description = 'ブログの説明文'
      @blog.user_id = current_user.id
      redirect_to(edit_blog_path(@blog.name)) if @blog.save
    else
      redirect_to(blog_path(current_user.blogs.first.name))
    end
  end

  def edit
    redirect_to(blog_path(@blog.name)) unless authorized?(@blog)
  end

  def update
    if authorized?(@blog)
      if @blog.update_attributes(blog_params)
        redirect_to(blog_path(@blog.name))
      else
        render :edit
      end
    else
      redirect_to(blog_path(@blog.name))
    end
  end

  def destroy
    if authorized?(@blog)
      @blog.destroy
      redirect_to(current_user)
    else
      redirect_to(blog_path(@blog.name))
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :name)
  end

  def set_blog
    @blog = Blog.friendly.find(params[:name])
  end
end
