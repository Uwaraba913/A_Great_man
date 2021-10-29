class HomesController < ApplicationController

  def top
  end

  def about
  end

  def random
    @posi_quote = Quote.where.not(admin_id: nil, category_id: 3).order("RAND()").first
    @nega_quote = Quote.where.not(admin_id: nil, category_id: 2).order("RAND()").first
  end

end
