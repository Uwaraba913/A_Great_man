class Admins::CommentsController < ApplicationController

  def destroy
    @quote = Quote.find(params[:quote_id])
    @comment = @quote.comments.find(params[:id]).destroy
    redirect_to admins_quote_path(@quote.id)
  end
end
