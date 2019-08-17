class ItemsController < ApplicationController
	def show
		@item = Item.find(params[:id])
		@item.user_id = current_user.id
	end

	def index
		#とりあえず試しにnewメソッド入れた
		# @items = Item.all
		@results = @search.result(distinct: true)
		@items = Item.all.order(release_date: "DESC")
		# byebug

	end

	def search

	end

	private
	def item_params
		params.require(:user).permit(:name, :price, :image)
	end



end
