class ItemsController < ApplicationController
	def show
		@item = Item.find(params[:id])
		@item.user_id = current_user.id
	end

	def index
		#とりあえず試しにnewメソッド入れた
		@items = Item.all
		@item = Item.where(['content LIKE ?', "%#{search}%"])
	end

	def search
		@items = Item.all
	end

	private
	def item_params
		params.require(:user).permit(:name, :price, :image)
	end



end
