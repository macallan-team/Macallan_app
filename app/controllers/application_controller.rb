class ApplicationController < ActionController::Base
respond_to :html,:json
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

# カレントエンドユーザーのかーとアイテム合計
def set_total
  set_tax_rate
  set_carriage_rate
    cart_items = current_end_user.cart_items
    array = []
    cart_items.each do |cart_item|
      array << (BigDecimal(cart_item.item.price.to_s) * BigDecimal(@tax_rate.to_s)).to_f.floor.to_i * cart_item.count
    end
    @total = array.sum + @carriage_rate
end

# 現在の税レートをせっと
def set_tax_rate
  @tax_rate = Tax.find_by(valid_flag: 'on').rate
end	

# 現在の送料レートをセット
def set_carriage_rate
  @carriage_rate = Carriage.find_by(valid_flag: 'on').rate
end	

# カートアイテムの販売ステータスと在庫をチェックし、結果に応じて変更を加える
def check_out_of_stock
  cart_items = current_end_user.cart_items
  cart_items.each do |cart_item|
    # 販売中または在庫が０より小さいとき、削除
    if cart_item.item.sales_status != 'on_sale' || cart_item.item.stock <= 0
      cart_item.destroy
      flash[:notice] = nil
      flash.now[:alert] = "カート内の「#{cart_item.item.album}」の販売が終了したため、削除されました。"
    # カートアイテムの数量がアイテムの在庫を上回った時、数量＝在庫数量に変更
    elsif cart_item.count > cart_item.item.stock
      cart_item.count = cart_item.item.stock
      cart_item.save
      flash[:notice] = nil
      flash.now[:alert] = "申し訳ございません。「#{cart_item.item.album}」は現在#{cart_item.count}点までしかご購入いただくことができません。"
    end
  end
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
