class OrdersController < ApplicationController
	def new
		@order = Order.new
		@orders = Order.all
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
	
end
