class ManageItemsController < ApplicationController
	def new
		@item = Item.new
		@category = Category.new
		@label = Label.new
		@artist = Artist.new
	end

	def update
		item = Item.find(item_params)
		item.update
	end

	def destroy
	end

	def show
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
		if @item.discs.nil?
			render :new
		else
			if @item.save
				redirect_to manage_item_path(@item)
			else
				render :new
			end
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
		@category = Category.new
		@label = Label.new
		@artist = Artist.new
	end
	private
	def item_params
		params.require(:item).permit(:album,:image,:price,:stock,:status,:category_id,:label_id,:sales_status,:release_date,
		discs_attributes: [:id, :_destroy,
		songs_attributes: [:id, :disc_id, :name, :artist_id, :song_order, :_destroy]])
	end
end
