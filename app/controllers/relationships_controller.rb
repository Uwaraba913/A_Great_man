class RelationshipsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @end_user = EndUser.find(params[:end_user_id])
    current_end_user.follow(@end_user)
  end

  def destroy
    @end_user = Relationship.find(params[:id]).following
    current_end_user.unfollow(@end_user)
  end

end
