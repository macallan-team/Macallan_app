class CategoriesController < ApplicationController
	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to new_manage_item_path
	end

	def destroy
	end

	def update
	end
	private
	def category_params
		params.require(:category).permit(:name)
	end
end
