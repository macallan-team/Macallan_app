class CategoriesController < ApplicationController
	def create
		@category = Category.new(category_params)
		@category.save
	end

	def destroy
		category = Category.find(params)
		category.destroy
		redirect_back(fallback_location: root_path)
	end

	def update
	end
	private
	def category_params
		params.require(:category).permit(:name)
	end
end
