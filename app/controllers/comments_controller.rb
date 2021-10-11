class CommentsController < ApplicationController

  def create
    @quote = Quote.find(params[:quote_id])
    @comment = current_end_user.comments.new(comment_params)
    @comment.quote_id = @quote.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
