class ApplicationController < ActionController::Base

  # def after_sign_out_path_for(resource)
  # 	root_path　#ログアウト後は商品の一覧ページに遷移
  # end

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_search
before_action :user_search

def set_search
  @search = Item.includes(:category, :label, discs: {songs: :artist}).where.not(sales_status: "deleted").ransack(params[:q])
end

# ユーザー検索
def  user_search
  @search_user = EndUser.ransack(params[:q])
  @param_q = params[:q]
  if @param_q.nil?
    @param_q = 1 flash.now[:alert] = '該当の検索結果はありませんでした。'
  end
end


before_action :correct_user, only: [:edit, :update]


 def correct_user
   correct_user = EndUser.find(params[:id])
  #  redirect_to root_path
 end

# def admin_user
#   redirect_to root_path unless current_user.admin?
# end

# カレントエンドユーザーのカートアイテム小計
def subtotal
  cart_items = current_end_user.cart_items
  array = []
  cart_items.each do |cart_item|
    array << (cart_item.item.price * cart_item.count)
  end
  @subtotal = array.sum
end


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
