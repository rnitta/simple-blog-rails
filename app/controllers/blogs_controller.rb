# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to_blog(@blog)
    else
      render :new
    end
  end

  def edit
    redirect_to_blog unless authorized?(@blog)
  end

  def update
    if authorized?(@blog)
      if @blog.update_attributes(blog_params)
        redirect_to_blog(@blog)
      else
        render :edit
      end
    else
      redirect_to_blog(@blog)
    end
  end

  def destroy
    if authorized?(@blog)
      @blog.destroy
      redirect_to(current_user)
    else
      redirect_to_blog(@blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :name)
  end

  def redirect_to_blog(blog)
    redirect_to("/blogs/#{blog.name}")
  end

  def authorized?(blog)
    blog.user_id == current_user.id
  end

  def set_blog
    @blog = Blog.friendly.find(params[:name])
  end
end
