class ManageItemsController < ApplicationController
	def new
		@item = Item.new
		@discs = @item.discs.build
		@songs = @discs.songs.build
	end

	def update
		item = Item.find(params[:id])
		item.update(item_params)
		redirect_to manage_item_path(item)
	end

	def destroy
	end

	def show
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to manage_item_path(@item)
		else
			render :new
		end
	end

	def index
		@items = Item.all.reverse_order.page(params[:page]).per(20)
	end

	def search
		@items = Item.all
	end
	
	def edit
		@item = Item.find(params[:id])
		@disc = @item.discs.build
		@song = @disc.songs.build
	end
	private
	def item_params
		params.require(:item).permit(:album,:image,:price,:stock,:status,:category_id,:artist_id,:label_id,:sales_status,:release_date,
		discs_attributes: [:id, :_destroy,
		songs_attributes: [:id, :disc_id, :name, :artist_id, :song_order, :_destroy]])
	end
end
