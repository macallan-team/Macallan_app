class OrdersController < ApplicationController
	before_action :authenticate_end_user!
	before_action :check_cart_existence,only: [:confirm,:new,:update,:create]
	def new
		@order = Order.new
		@addresses = Address.where(end_user_id: current_end_user.id)
		check_out_of_stock
		render :new
	end

	def confirm
		check_out_of_stock
		set_subtotal
		set_total
		@order = Order.new(payment: params[:payment])
		@cart_items = current_end_user.cart_items
		use_address = params[:use_address]
		if use_address == 'mine'
			@shipping_name = current_end_user.last_name + " " + current_end_user.first_name
			@shipping_address = current_end_user.address
			@shipping_postal_code = current_end_user.postal_code
			@shipping_phone_number = current_end_user.phone_number
		else
			address = current_end_user.addresses.find_by(id: params[:use_address])
			if address.nil?
				render :new
			else
				@shipping_name = address.name
				@shipping_address = address.address
				@shipping_postal_code = address.postal_code
				@shipping_phone_number = address.phone_number
			end
		end


	end

	def create
		set_subtotal
		set_total
		cart_items = current_end_user.cart_items
		cart_items.each do |cart_item|
			if cart_item.count > cart_item.item.stock
				redirect_to cart_items_path
			end
		end
		order = Order.new(order_params)
		order.end_user_id = current_end_user.id
		order.purchased_at = Time.now
		order.shipping_status = '受付'
		order.subtotal = @subtotal
		order.total_price = @total
		order.carriage_rate = @carriage_rate
		order.tax_rate = @tax_rate
		ActiveRecord::Base.transaction do
			order.save!
			cart_items.each do |cart_item|
				order_item = OrderItem.create!({
						order_id: order.id,
						item_id: cart_item.item.id,
						count: cart_item.count,
						price: cart_item.item.price})
				item = cart_item.item
				item.update!(stock: (item.stock - cart_item.count))
			end
		end
		cart_items.destroy_all
		redirect_to complete_order_path
	end

	def update
	end

	def index
		@orders = current_end_user.orders.order(created_at: :desc).page(params[:page]).per(5)
	end

	def complete

	end

	def edit
		@order = Order.find(params[:id])
	end

	private
	def order_params
		params.require(:order).permit(:payment,:use_address,:total_price,:shipping_name,:shipping_address,:shipping_postal_code,:shipping_phone_number,:subtotal)
	end
	def check_cart_existence
		if current_end_user.cart_items.any?
		else
			redirect_to items_path
		end
	end
end
