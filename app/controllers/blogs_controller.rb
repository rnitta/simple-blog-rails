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
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      redirect_to_blog(@blog)
    else
      render :edit
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect_to(current_user)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :name)
  end

  def redirect_to_blog(blog)
    redirect_to("/blog/#{blog.name}")
  end
end
