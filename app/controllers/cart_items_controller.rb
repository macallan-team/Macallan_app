class CartItemsController < ApplicationController
	before_action :authenticate_end_user!
	before_action :exclusion

	def exclusion
	end

	def create
		cart_item = current_end_user.cart_items.find_by(item_id: cart_item_params[:item_id])
		if cart_item.nil?
			cart_item = CartItem.new(cart_item_params)
			cart_item.end_user_id = current_end_user.id
			cart_item.save
		else
			cart_item.count += cart_item_params[:count].to_i
			cart_item.save
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
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
	end

		# 投稿データのストロングパラメーター
	private
	def cart_item_params
		params.require(:cart_item).permit(:count,:item_id)
	end
end
