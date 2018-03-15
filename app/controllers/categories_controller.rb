# frozen_string_literal:true

class CategoriesController < ApplicationController
  include BlogsHelper
  before_action :require_authority, except: [:show, :create]
  before_action :set_blog, only: [:index, :show, :new, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    category = Category.create(name: '新規カテゴリ', blog_id: @blog.id)
    redirect_to(edit_blog_category_path(@blog.name, category.id))
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:blog_name])
  end

  def set_category
    @category = Blog.friendly.find(params[:blog_name]).categories.find(params[:id])
  end

  def require_authority
    set_blog
    redirect_to(blog_path(@blog.name)) unless authorized?(@blog)
  end

  def category_params
    params.require(:article).permit(:name)
  end
end
