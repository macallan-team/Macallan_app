class ApplicationController < ActionController::Base

  # def after_sign_out_path_for(resource)
  # 	root_path　#ログアウト後は商品の一覧ページに遷移
  # end

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_search
before_action :user_search

def set_search
  @search = Item.includes(:category, :label,:artist, discs: [:songs]).where(sales_status: "on_sale").ransack(params[:q])
end

# ユーザー検索
def  user_search
  @search_user = EndUser.ransack(params[:q])
  @param_q = params[:q]
  if @param_q.nil?
    @param_q = 1
  end
end


# def admin_user
#   redirect_to root_path unless current_user.admin?
# end

# カレントエンドユーザーのカートアイテム小計
def set_subtotal
  cart_items = current_end_user.cart_items
  array = []
  cart_items.each do |cart_item|
    array << (cart_item.item.price * cart_item.count)
  end
  @subtotal = array.sum
end

def set_total
  set_tax_rate
  set_carriage_rate
    cart_items = current_end_user.cart_items
    array = []
    cart_items.each do |cart_item|
      array << (BigDecimal(cart_item.item.price.to_s) * BigDecimal(@tax_rate.to_s)).to_f.ceil.to_i * cart_item.count
    end
    @total = array.sum + @carriage_rate
end

def set_tax_rate
  @tax_rate = Tax.find_by(valid_flag: 'on').rate
end	
def set_carriage_rate
  @carriage_rate = Carriage.find_by(valid_flag: 'on').rate
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
