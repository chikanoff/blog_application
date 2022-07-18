# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :fetch_tag, only: %i[show edit update destroy]

  # GET /tags/:id
  def show
    @articles = @tag.articles
  end

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to @tag
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
  end

  private

  def fetch_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
