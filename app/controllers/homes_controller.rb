class HomesController < ApplicationController

  def top
    @quotes = Quote.where.not(admin_id: nil).order(created_at: "DESC").limit(10)
  end

  def about
  end

  def random
    @posi_quote = Quote.where.not(admin_id: nil, category_id: 3).order("RAND()").first
    @nega_quote = Quote.where.not(admin_id: nil, category_id: 2).order("RAND()").first
  end

end
