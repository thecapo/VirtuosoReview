class CommentsController < ApplicationController
  def create
    @art = Art.find(params[:id])
    @comment = @art.comments.create(comment_params)
  end

  def edit
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
