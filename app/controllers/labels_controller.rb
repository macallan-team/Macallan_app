class LabelsController < ApplicationController
	def create
		@label = Label.new(label_params)
		@label.save
		@labels = Label.all
	end

	def destroy
		label = Label.find(params[:id])
		label.destroy
		redirect_to new_manage_item_path
	end

	def update
	end
	private
	def label_params
		params.require(:label).permit(:name)
	end
end
