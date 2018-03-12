# frozen_string_literal:true

class ArticlesController < ApplicationController
  include BlogsHelper
  before_action :set_blog, only: [:index, :show, :new]
  before_action :set_article, only: [:show]

  def index
    redirect_to(blog_path(@blog.name)) unless authorized?(@blog)
    @articles = Blog.friendly.find(params[:blog_name]).articles
  end

  def show
  end

  def new
    redirect_to(blog_path(@blog.name)) unless authorized?(@blog)
    @article = Article.new
  end

  def create
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

  def set_article
    @article = Blog.friendly.find(params[:blog_name]).articles.friendly.find(params[:name])
  end
end
