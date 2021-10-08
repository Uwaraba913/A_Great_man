class Admins::QuotesController < ApplicationController

  def new
    @quote = Quote.new
    @categories = Category.all
    @persons = PersonProfile.all
  end

  def create
    quote = Quote.new(quote_params)
    quote.save
    redirect_to admins_quote_path(quote.id)
  end

  def index
    @quotes = Quote.where(params[:admin_id])
  end

  def user_posts
    @quotes = Quote.where(params[:end_user_id])
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def edit
    @quote = Quote.find(params[:id])
    @categories = Category.all
    @persons = PersonProfile.all
  end

  def update
    quote = Quote.find(params[:id])
    quote.update(quote_params)
    redirect_to admins_quote_path(quote.id)
  end

  def destroy
    quote = Quote.find(params[:id])
    quote.destroy
    redirect_to admins_quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:admin_id, :category_id, :person_profile_id, :content )
  end

end
