class CommentsController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource

  def create
    @art = Art.find(params[:art_id])
    @comment = @art.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to art_path(@art)
    else 
      redirect_to art_path(@art)
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
      params.require(:comment).permit(:body, :art_id, :avatar, :remove_avatar, :avatar_cache, :comment_rating)
    end

end
