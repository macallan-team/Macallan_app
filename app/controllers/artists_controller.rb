class ArtistsController < ApplicationController

	before_action :authenticate_admin!

	def create
		@artist = Artist.new(artist_params)
		@artist.save
		flash.now[:notice] = "アーティストを登録しました。"
	end

	def destroy
		artist = Artist.find(params[:id])
		artist.destroy
		redirect_to new_manage_item_path, :alert => "アーティストを削除しました。"
	end

	def update
	end
	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end
