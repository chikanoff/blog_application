# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :fetch_article, only: %i[show edit update destroy]

  def index
    @available_tags = Tag.where.not(id: params[:tags_ids])
    @articles = if params[:tags_ids].present?
                  Article.select_with_tags(*params[:tags_ids])
                else
                  Article.all
                end
  end

  def show; end

  def new
    @article = Article.new
    @tags = Tag.excluding(@article.tags).all
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tags = Tag.excluding(@article.tags).all
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def fetch_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, tag_ids: [])
  end
end
