class ArtsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

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
