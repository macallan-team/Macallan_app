class ItemsController < ApplicationController
	def show
		# require "byebug"; byebug
		@item = Item.find(params[:id])
		@reviews = @item.reviews.page(params[:page]).per(3)
		@discs = @item.discs
		if end_user_signed_in?
			if current_end_user.reviews.any?
				@review = Review.new
				@review = current_end_user.reviews.find_by(item_id: @item.id)
			else
				@review = Review.new
			end
			
		end
	end

	def index
		@results = @search.result(distinct: true).order(release_date: "DESC").page(params[:page]).per(9)
	end


	def search
	end

	private
	def item_params
		params.require(:end_user).permit(:name, :price, :image)
	end



end
