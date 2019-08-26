class ManageEndUsersController < ApplicationController

	# before_action :authenticate_admin!

	before_action :authenticate_admin!
	

	def show
		@end_user = EndUser.find(params[:id])
		@orders = Order.where(end_user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(5)
	end

	def destroy
		@end_user = EndUser.find(params[:id])
		@end_user.destroy
		redirect_to manage_end_users_path
	end

	def update
		@end_user = EndUser.find(params[:id])
		if @end_user.update(end_user_params)
			redirect_to manage_end_user_path(@end_user)
		else
		   render :edit
		end
	end

	def index
		@end_user = EndUser.all
		@results = @search_user.result(distinct: true)
    end

	def search
		# 検索フォームで取得したパラメーターをモデルに渡す
		# @search = EndUser.search(params{search})
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end
end


	private
    def end_user_params
		 params.require(:end_user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :phone_number, :email)
    end
