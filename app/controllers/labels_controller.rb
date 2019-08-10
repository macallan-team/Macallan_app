class LabelsController < ApplicationController
	def create
		@label = Label.new(label_params)
		@label.save
	end

	def destroy
	end

	def update
	end
	private
	def label_params
		params.require(:label).permit(:name)
	end
end
