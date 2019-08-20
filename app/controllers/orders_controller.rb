class OrdersController < ApplicationController
	before_action :authenticate_end_user!
	def new
		@order = Order.new
		@user = current_end_user
		@addresses = Address.where(end_user_id: current_end_user.id)
	end

	def confirm
		@order = Order.new(payment: order_params[:payment])
		@cart_items = current_end_user.cart_items
		use_address = order_params[:use_address]
			# use_addressがmineならユーザー自身の住所をインスタンスに
		if use_address == 'mine'
			@shipping_name = current_end_user.last_name + " " + current_end_user.first_name
			@shipping_address = current_end_user.address
			@shipping_postal_code = current_end_user.postal_code
			@shipping_phone_number = current_end_user.phone_number
		else
			# 選択された配送先をfind_by後、インスタンス変数に入れる
			address = current_end_user.addresses.find_by(id: order_params[:use_address])
			@shipping_name = address.name
			@shipping_address = address.address
			@shipping_postal_code = address.postal_code
			@shipping_phone_number = address.phone_number
		end
		
		
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
