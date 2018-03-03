# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  def show
    @blog = Blog.find_by(name: params[:name])
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
    @blog = Blog.find(params[:id])
    redirect_to_blog unless authorized?(@blog)
  end

  def update
    @blog = Blog.find(params[:id])
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
    blog = Blog.find(params[:id])
    if authorized?(blog)
      blog.destroy
      redirect_to(current_user)
    else
      redirect_to_blog(blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :name)
  end

  def redirect_to_blog(blog)
    redirect_to("/blog/#{blog.name}")
  end

  def authorized?(blog)
    blog.user_id == current_user.id
  end
end
