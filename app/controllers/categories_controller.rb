class CategoriesController < ApplicationController
	before_action :authenticate_admin!
	def create
		@category = Category.new(category_params)
		@category.save
		flash.now[:notice] = 'ジャンルを登録しました。'
	end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		redirect_to new_manage_item_path, :alert => "ジャンルを削除しました。"
	end

	def update
	end
	private
	def category_params
		params.require(:category).permit(:name)
	end
end
