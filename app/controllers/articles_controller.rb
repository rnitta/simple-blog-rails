# frozen_string_literal:true

class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
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

  def set_article
    @article = Blog.friendly.find(params[:blog_name]).articles.friendly.find(params[:name])
  end
end
