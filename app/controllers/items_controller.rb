class ItemsController < ApplicationController
	def show
		# require "byebug"; byebug
		@item = Item.find(params[:id])
		@reviews = @item.reviews
		@review = Review.new
		@discs = @item.discs
		@cart_item = CartItem.new
	end

	def index
		@results = @search.result(distinct: true).order(release_date: "DESC").page(params[:page]).per(15)
	end


	def search
	end

	private
	def item_params
		params.require(:end_user).permit(:name, :price, :image)
	end



end
