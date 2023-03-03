class CommentsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])
    @comment = @flat.comments.new(comment_params)
    @comment.flat = @flat
    @comment.user = current_user
    @comment.save
    redirect_to flat_path(@flat)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
