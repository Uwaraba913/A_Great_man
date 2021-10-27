class CommentsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @quote = Quote.find(params[:quote_id])
    @comment = current_end_user.comments.new(comment_params)
    @comment.quote_id = @quote.id
    @comments = @quote.comments.order(created_at: "DESC").page(params[:page]).per(10)
    unless  @comment.save
      render "error"
    end
  end

  def destroy
    @quote = Quote.find(params[:quote_id])
    @comment = @quote.comments.find(params[:id]).destroy
    @comments = @quote.comments.page(params[:page]).order(created_at: "DESC").per(10)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
