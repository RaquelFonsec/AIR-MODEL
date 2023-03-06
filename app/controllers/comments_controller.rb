class CommentsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])
    @comment = Comment.new(comment_params)
    @comment.flat = @flat
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to flat_path(@flat)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
