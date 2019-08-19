class OrdersController < ApplicationController
	before_action :authenticate_end_user!
	def new
		@order = Order.new
		@user = current_end_user
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
	def pay
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
		Payjp::Charge.create(
		  :amount => params[:amount],
		  :card => params['payjp-token'],
		  :currency => 'jpy'
		)
	end	  
	private
	def order_params
		params.require(:order).permit(:payment,:use_address)
	end
end
