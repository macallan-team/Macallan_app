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
				flash.now[:notice] = "カートに追加しました。"
				
			end
		else
			cart_item.count += cart_item_params[:count].to_i
			cart_item.save
			flash.now[:notice] = "カート内の数量が変更されました。"
		end
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to item_path(@cart_item.item)
	end

	def index
		set_subtotal
		set_total
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:count,:item_id)
	end

end
