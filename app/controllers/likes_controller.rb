class LikesController < ApplicationController

	before_action :set_item

	def create
		@like = Like.create(end_user_id: current_user.id, item_id: params[:item_id])
		@likes = Like.where(item_id: params[:item_id])
		@item.reload
	end

	def destroy
		like = Like.find_by(end_user_id: current_user.id, item_id: params[:item_id])
		like.destroy
		@likes = Like.where(item_id: params[:item_id])
		@item.reload
	end

	private
	def set_item
		@item = Item.find(params[:item_id])
	end

end
