class CartItemsController < ApplicationController
	def create
		@new_cart_item = CartItem.new(cart_item_params)
		@new_cart_item.save
		redirect_to cart_items
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to confirm_order(end_users.id)
	end

	def index
		@new_cart_item = CartItem.new
		@cart_items = CartItem.all
	end

		# 投稿データのストロングパラメーター
	private
	def cart_item_params
		params.require(:cart_item).permit(:count)
	end
end
