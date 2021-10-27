# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
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

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    if !!current_end_user && current_end_user&.is_withdrawal != true #ユーザーが存在する場合（true）かつユーザーの退会フラグがfalseの時
      reset_session
      flash[:alert] = "このアカウントは退会済みです。"
      redirect_to request.referer
    end
  end
end
