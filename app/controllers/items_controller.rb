class ItemsController < ApplicationController
	def show
		@item = Item.find(params[:id])
		@reviews = Review.all
		@cart_item = CartItem.new
		
		
	end

	def index
		@results = @search.result.includes(discs:[:songs]).joins(discs:[:songs]).page(params[:page]).per(15)
		respond_to do |format|
			format.html
			format.js
		end	
	end



end
