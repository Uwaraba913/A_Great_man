class QuotesController < ApplicationController

  def new
    @quote = Quote.new
    @categories = Category.all
  end

  def create
    quote = Quote.new(quote_params)
    quote.save
    redirect_to quote_path(quote.id)
  end

  def index
    if params[:quote_selection] == '偉人名(迷)言'
      if params[:word]
        @quotes = Quote.where.not(admin_id: nil).where('content LIKE?', "%#{params[:word]}%")
      else
        @quotes = Quote.where.not(admin_id: nil)
      end
    else
      if params[:word]
        @quotes = Quote.where.not(end_user_id: nil).where('content LIKE?', "%#{params[:word]}%")
      end
      render '/quotes/user_posts'
    end
  end

  def user_posts
    @quotes = Quote.where.not(end_user_id: nil)
  end

  def show
    @quote = Quote.find(params[:id])
    @end_user = @quote.end_user
    @comment = Comment.new
  end

  def edit
    @quote = Quote.find(params[:id])
    @categories = Category.all
  end

  def update
    quote = Quote.find(params[:id])
    quote.update(quote_params)
    redirect_to quote_path(quote.id)
  end

  def destroy
    quote = Quote.find(params[:id])
    quote.destroy
    redirect_to quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:end_user_id, :category_id, :person_image, :person_name, :content)
  end
end
