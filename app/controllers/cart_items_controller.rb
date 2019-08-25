class CartItemsController < ApplicationController
	before_action :authenticate_end_user!

	def create
		# 同アイテムがあれば加算・なければNEW
		cart_item = current_end_user.cart_items.find_by(item_id: cart_item_params[:item_id])
		if cart_item.nil?
			cart_item = CartItem.new(cart_item_params)
			if cart_item.item.sales_status == 'on_sale'
				cart_item.end_user_id = current_end_user.id
				cart_item.save
				flash.now[:notice] = "「#{cart_item.item.album}」をカートに追加しました。"
			end
			check_out_of_stock
		else
			cart_item.count += cart_item_params[:count].to_i
			cart_item.save
			flash.now[:notice] = "カート内の「#{cart_item.item.album}」の数量が変更されました。"
			check_out_of_stock
		end
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path, :alert => "カートから商品を削除しました。"
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to item_path(@cart_item.item)
		check_out_of_stock
	end

	def index
		set_subtotal
		set_total
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		check_out_of_stock
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:count,:item_id)
	end
end
