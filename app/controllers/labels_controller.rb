class LabelsController < ApplicationController
	before_action :authenticate_admin!
	def create
		@label = Label.new(label_params)
		@label.save
		@labels = Label.all
		flash.now[:notice] = 'レーベルを登録しました。'
	end

	def destroy
		label = Label.find(params[:id])
		label.destroy
		redirect_to new_manage_item_path, :alert => "レーベルを削除しました。"
	end

	def update
	end
	private
	def label_params
		params.require(:label).permit(:name)
	end
end
