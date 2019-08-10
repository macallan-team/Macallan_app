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

	def index
	end

	def search
	end

	def edit
	end
end
