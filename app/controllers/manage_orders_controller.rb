class ManageOrdersController < ApplicationController

	before_action :authenticate_admin!

	def update
		@order = Order.find(params[:id])
		@order.update(item_params)
		redirect_to manage_orders_path
	end

	def destroy
		order = Order.find(params[:id])
		order.destroy
		redirect_to manage_orders_path
	end


	def index
		@search = Order.ransack(params[:q])
		@results = @search.result.page(params[:page]).per(10)
	end

	def edit
		@order = Order.find(params[:id])

	end

	private
	def item_params
		params.require(:order).permit(:shipping_name, :shipping_phone_number, :shipping_postal_code, :shipping_address, :shipping_status)
	end


end
