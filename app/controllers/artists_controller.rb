class ArtistsController < ApplicationController
	def create
		@artist = Artist.new(artist_params)
		@artist.save
		redirect_to new_manage_item_path
	end

	def destroy
	end

	def update
	end
	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end
