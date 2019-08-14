class OrdersController < ApplicationController
	def new
		@order = Order.new
		@orders = Order.all
	end

	def confirm
		# ユーザーがカートに入れた商品を条件式で表示
		@order = Order.where(params[:id])
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
