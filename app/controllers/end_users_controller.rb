class EndUsersController < ApplicationController

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
    redirect_to end_user_path(end_user.id)
  end

  def withdrawal #退会確認ページ
    @end_user = EndUser.find(params[:id])
  end

  def unsubscribe #退会フラグを更新
    end_user = EndUser.find(params[:id])
    end_user.update(is_withdrawal: false)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。"
    redirect_to root_path
  end

  def following
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.followings
    @quotes = @end_user.quote.limit(3).order(created_at: :desc)
  end

  def followers
    @end_user = EndUser.find_by(id: params[:id])
    @end_users = @end_user.followers
    @quotes = @end_user.quote.limit(3).order(created_at: :desc)
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email, :introduction, :is_withdrawal, :image)
  end

end
