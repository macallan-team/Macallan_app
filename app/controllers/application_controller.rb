class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
    end_user_path(resource) # ログイン後に遷移するpathを設定
  end


  # def after_sign_out_path_for(resource)
  # 	root_path
  # end

before_action :configure_permitted_parameters, if: :devise_controller?

   protected

     def configure_permitted_parameters
       #以下の:name部分は追加したカラム名に変える
       devise_parameter_sanitizer.permit(:sign_up, keys: [
       	:last_name,
       	:first_name,
       	:last_kana,
       	:first_kana,
       	:postal_code,
       	:address,
       	:phone_number
       ])
     end


end