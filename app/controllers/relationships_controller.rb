class RelationshipsController < ApplicationController

  def create
    @end_user = EndUser.find(params[:end_user_id])
    current_end_user.follow(@end_user)
    redirect_to request.referer
  end

  def destroy
    @end_user = Relationship.find(params[:id]).following
    current_end_user.unfollow(@end_user)
    redirect_to request.referer
  end

end
