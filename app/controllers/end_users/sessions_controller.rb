# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # before_action :correct_user

  def after_sign_in_path_for(resource)
    end_user_path(resource) # ログイン後にマイページへ遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後にItemのインデックスへ遷移するpathを設定
  end


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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  # private
  # def correct_user
  #   user = EndUser.find(params[:id])
  #   if current_end_user != user
  #     redirect_to end_user_path(current_end_user)
  #   end
  # end


end
