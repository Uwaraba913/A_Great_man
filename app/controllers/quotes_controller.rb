class QuotesController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :create, :user_posts, :edit, :update, :destroy]
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
        if params[:evaluation_ranking] == 'good'
          @quotes.order(:evaluation_good.count desc)
        end
      end
    elsif params[:quote_selection] == 'ユーザー名(迷)言'
      if params[:word]
        @quotes = Quote.where.not(end_user_id: nil).where('content LIKE?', "%#{params[:word]}%")
      end
      render '/quotes/user_posts'
    else
      @quotes = Quote.where.not(admin_id: nil)
      if params[:evaluation_ranking] == 'good'
        @quotes = Quote.left_joins(:good_evaluations).where.not(admin_id: nil).order("cnt_good desc").group(:id).select("quotes.*, count(evaluations.quote_id) cnt_good")
      end
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
