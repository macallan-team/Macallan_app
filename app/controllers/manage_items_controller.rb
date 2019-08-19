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
		item = Item.find(params[:id])
		item.update(sales_status: 'deleted')
		redirect_to manage_item_path(params[:id])
	end

	def show
		@item = Item.find(params[:id])
		@search = Item.ransack(params[:q])
	end

	def create
		@item = Item.new(item_params)
		if @item.save!
			redirect_to manage_item_path(@item)
		else
			render :new
		end
	end

	def index
		# Itemテーブルを検索
		@search = Item.ransack(params[:q])
		# 検索結果・ページネーション
		@results = @search.result.includes(discs:[:songs]).joins(discs:[:songs]).page(params[:page])
	end

	def move_higher
		Song.find(params[:id]).move_higher
		redirect_to manage_items_path
	end

	def move_lower
		Song.find(params[:id]).move_lower
		redirect_to manage_items_path
	end
	
	def edit
		@item = Item.find(params[:id])
	end
	private
	def item_params
		params.require(:item).permit(:album,:image,:price,:stock,:category_id,:artist_id,:label_id,:sales_status,:release_date,
		discs_attributes: [:id, :_destroy,
		songs_attributes: [:id, :disc_id, :name, :artist_id, :song_order, :_destroy]])
	end
end
