class LikesController < ApplicationController

before_action :set_variables, only: [:create, :destroy]

def index
	@likes = current_end_user.likes.page(params[:page]).per(5)
	@cart_item = CartItem.new
end

def create
		like = current_end_user.likes.new(item_id: @item.id)
		like.save
		flash.now[:notice] = "「#{@item.album}」にいいねしました。"
end

def destroy
	like = current_end_user.likes.where(item_id: @item.id)
	like.destroy_all
	flash.now[:alert] = "「#{@item.album}」のいいねを取り消しました。"
end

# ストロングパラメータ
private
def set_variables
	@item = Item.find(params[:item_id])
	@id_name = "#like-link-#{@item.id}"
	@id_heart = "#heart-#{@item.id}"
end
def item_params
	params.require(:end_user).permit(:name, :price, :image)
end
def like_params
	params.require(:like).permit(:item_id)
end

end
