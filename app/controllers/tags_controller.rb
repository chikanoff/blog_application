class TagsController < ApplicationController

  before_action :fetch_tag, only: [:show, :edit, :update, :destroy]

  def show # GET /tags/:id
    @articles = @tag.articles
  end

  def index # GET /tags
    @tags = Tag.all
  end

  def new # GET /tags/new
    @tag = Tag.new
  end

  def create # POST /tags
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag, notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  def edit # GET /tags/:id/edit
  end
  
  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  private

  def fetch_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
