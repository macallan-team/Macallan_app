class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
    end_user_path(resource) # ログイン後にマイページへ遷移するpathを設定
  end


  # def after_sign_out_path_for(resource)
  # 	root_path　#ログアウト後は商品の一覧ページに遷移
  # end

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :correct_user, only: [:edit, :update]


 def correct_user
   correct_user = EndUser.find(params[:id])
  #  redirect_to root_path
 end

# def admin_user
#   redirect_to root_path unless current_user.admin?
# end



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