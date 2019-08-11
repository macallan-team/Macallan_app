class CategoriesController < ApplicationController
	def create
		@category = Category.new(category_params)
		@category.save
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
