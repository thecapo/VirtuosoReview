class ArtsController < ApplicationController
  def index
    @arts = Art.all
  end
  
  def new
    @art = Art.new
  end 

  def create
    @art = Art.new
    if @art.save(art_params)
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
      params.require(:art).permit(:title, :about)
    end

end
