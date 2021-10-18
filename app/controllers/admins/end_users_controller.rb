class Admins::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @quotes = @end_user.quotes
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to admins_end_user_path(end_user.id)
  end
  
  private
  
  def end_user_params
    params.require(:end_user).permit(:email, :name, :image, :introduction, :is_withdrawal)
  end

end
