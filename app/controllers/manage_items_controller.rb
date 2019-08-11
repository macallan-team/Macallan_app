class ManageItemsController < ApplicationController
	def new
		@item = Item.new
		@category = Category.new
		@label = Label.new
		@artist = Artist.new
		@categories = Category.all
		@labels = Label.all
		@artists = Artist.all
	end

	def update
	end

	def destroy
	end

	def show
	end

	def create
		@item = Item.create(item_params)
	end

	def index
	end

	def search
	end

	def edit
	end
	private
	def item_params
		params.require(:item).permit(:album,:image,:price,:stock,:status,:category_id,:label_id,:sales_status,
		discs_attributes: [:id, :_destroy,
			songs_attributes: [:id, :disc_id, :name, :artist_id, :song_order, :_destroy] ])
	end
end
