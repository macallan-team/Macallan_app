class ManageEndUsersController < ApplicationController
	def show
        @end_user = EndUser.find(params[:id])

	end

	def update
	end

	def index
	end

	def search
	end

	def edit
	end
end


	private
    def end_user_params
    	 params.require(:end_user).permit()