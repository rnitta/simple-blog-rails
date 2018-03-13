# frozen_string_literal:true

class ArticlesController < ApplicationController
  include BlogsHelper
  before_action :require_authority, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_blog, only: [:index, :show, :new, :create]
  before_action :set_article, only: [:show]

  def index
    @articles = Blog.friendly.find(params[:blog_name]).articles
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.blog_id = @blog.id
    @article.category_id = Category.find_or_create_by(blog_id: @blog.id, name: category_params[:category]).id
    if @article.save
      redirect_to(blog_article_path(@blog.name, @article.name))
    else
      render :new
    end
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

  def require_authority
    set_blog
    redirect_to(blog_path(@blog.name)) unless authorized?(@blog)
  end

  def article_params
    params.require(:article).permit(:title, :content, :name)
  end

  def category_params
    params.require(:article).permit(:category)
  end
end
