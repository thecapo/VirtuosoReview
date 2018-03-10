class CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    @art = Art.find(params[:art_id])
    @comment = @art.comments.create(comment_params)
    if @comment.save
      redirect_to art_path(@art)
    else 
      render 'new'
    end
  end

  def edit
    @art = Art.find(params[:art_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @art = Art.find(params[:art_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to art_path(@art)
    else
      render 'edit'
    end
  end

  def destroy
    @art = Art.find(params[:art_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to art_path(@art)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :art_id)
    end
end
