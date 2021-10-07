class Admins::QuotesController < ApplicationController

  def new
    @quote = Quote.new
  end

  def create
    quote = Quote.new(quote_params)
    quote.save
    redirect_to admins_quote_path(quote.id)
  end

  def index
    @quotes = Quote.where(admin_id)
  end

  def user_posts
    @quotes = Quote.where(end_user_id)
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    quote = Quote.find(params[:id])
    quote.update(quote_params)
    redirect_to admins_quote_path(quote.id)
  end

  def destroy
    quote = Quote.find(params[:id])
    quote.destroy
  end
  
  private
  
  def quote_params
    params.require(:quote).permit(:admin_id, :category_id, :person_profile_id, )
  end
  
end
