class ArtsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
load_and_authorize_resource

  def search
    Art.reindex
    if params[:search].present?
      @arts = Art.search(params[:search], fields: [:title], match: :word_start)
      @arts.each do |art|
        art.title
      end
    else
      @arts = Art.all
    end
  end

  def index
    @arts = Art.all
  end
  
  def new
    @art = Art.new
  end 

  def create
    @art = current_user.arts.new(art_params)
    if @art.save
      redirect_to art_path(@art)
    else
      render 'new'
    end
  end

  def show
    @art = Art.find(params[:id])
    if @art.comments.blank?
      @average_comment = 0
    else
      @average_comment = @art.comments.average(:comment_rating).round(2)
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update(art_params)
      redirect_to art_path(@art)
    else
      render 'edit'
    end
  end

  def destroy
    @art = Art.find(params[:id])
    if @art.destroy
      redirect_to arts_path
    end
  end

  private
  
    def art_params
      params.require(:art).permit(:title, :about, :image, :remove_image, :image_cache)
    end

end
