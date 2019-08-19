class OrdersController < ApplicationController
	before_action :authenticate_end_user!
	def new
		@order = Order.new
		@addresses = Address.where(end_user_id: current_end_user.id)
	end

	def confirm
		@order = Order.new(order_params)
	end

	def create
	end

	def update
	end

	def index
		@orders = Order.page(params[:page]).per(5)
	end

	def complete

	end
	private
	def order_params
		params.require(:order).permit(:payment,:use_address)
	end
end
