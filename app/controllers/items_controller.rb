class ItemsController < ApplicationController
	def show
		# require "byebug"; byebug
		@item = Item.find(params[:id])
		@reviews = @item.reviews
		@review = Review.new
		@discs = @item.discs
	end

	def index
		@results = @search.result(distinct: true).order(release_date: "DESC")
	end


	def search
	end

	private
	def item_params
		params.require(:end_user).permit(:name, :price, :image)
	end



end
