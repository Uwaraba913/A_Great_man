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
    @quotes = Quote.where.not(admin_id: nil)
  end

  def user_posts
    @quotes = Quote.where.not(end_user_id: nil)
  end

  def show
    @quote = Quote.find(params[:id])
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
