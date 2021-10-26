# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  before_action :end_user_exist?, only: [:create]
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def end_user_exist?
    if current_end_user.nil?
      flash[:error] = "そのアカウントは登録されていません。"
      redirect_to request.referer
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    if current_end_user.is_withdrawal != true
      reset_session
      flash[:notice] = "このアカウントは退会済みです。"
      redirect_to request.referer
    end
  end
end
