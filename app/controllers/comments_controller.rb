class CommentsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @quote = Quote.find(params[:quote_id])
    @comment = current_end_user.comments.new(comment_params)
    @comment.quote_id = @quote.id
    @comment.save
  end

  def destroy
    @quote = Quote.find(params[:quote_id])
    @comment = @quote.comments.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
