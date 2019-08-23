class LikesController < ApplicationController

before_action :set_variables

def create
	like = current_end_user.likes.new(item_id: @item.id)
	like.save
	flash.now[:notice] = "いいねしました。"
end

def destroy
	like = current_end_user.likes.find_by(item_id: @item.id)
	like.destroy
	flash.now[:alert] = "いいねを取り消しました。"
end

# ストロングパラメータ
private
def set_variables
	@item = Item.find(params[:item_id])
	@id_name = "#like-link-#{@item.id}"
	@id_heart = "#heart-#{@item.id}"
end


end
