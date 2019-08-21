class ManageOrdersController < ApplicationController
	def update
		@order = Order.find(params[:id])
		@order.update(item_params)
	end

	def destroy
		order = Order.find(params[:id])
		order.destroy
		redirect_to manage_orders_path
	end

	def show
	end

	def index
		@orders = Order.all
		@order_items = OrderItem.all
		@items = Item.all
		@addresses =Address.all
		# @search = Item.ransack(params[:q])
	end

	def search
		#とりあえず試しに入れてみる
		@item = Item.new
		@items = Item.all
		@item = Item.where(['content LIKE ?', "%#{search}%"])
	end

	def edit
		@order = Order.find(params[:id])
	end

	private
	def item_params
		params.require(:user).permit(:name, :price)
	end


end
