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
		item.update!(sales_status: 'deleted')
		cart_items = item.cart_items
		cart_items.destroy_all
		# 削除済みを省いたインデックスにリダイレクト
		redirect_to '/manage_items/?q%5Bsales_status_not_eq%5D=2'
	end

	def show
		@search = Item.ransack(params[:q])
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
		# 検索結果・ページネーション
		@search = Item.ransack(params[:q])
		@results = @search.result.includes(discs:[:songs]).joins(discs:[:songs]).page(params[:page])
	end
		# acts_as_list使用
	def move_higher
		Song.find(params[:id]).move_higher
		song = Song.find(params[:id])
		@disc = song.disc
	end
		# acts_as_list使用
	def move_lower
		Song.find(params[:id]).move_lower
		song = Song.find(params[:id])
		@disc = song.disc

	end

		#  削除フラグを外す
	def restore
		item = Item.find(params[:id])
		item.sales_status = 'suspension'
		item.save
		redirect_to manage_item_path(item)
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
