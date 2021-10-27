class Admins::QuotesController < ApplicationController
  before_action :authenticate_admin!
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
    @quotes = Quote.where.not(admin_id: nil).order(created_at: "DESC").all.page(params[:page]).per(12)
  end

  def user_posts
    @quotes = Quote.where.not(end_user_id: nil).order(created_at: "DESC").all.page(params[:page]).per(12)
  end

  def show
    @quote = Quote.find(params[:id])
    @comments = @quote.comments.order(created_at: "DESC").all.page(params[:page]).per(10)
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
