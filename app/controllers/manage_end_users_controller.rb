class ManageEndUsersController < ApplicationController
	def show
		@end_user = EndUser.find(params[:id])
		@orders = Order.all
	end

	def destroy
		@end_user = EndUser.find(params[:id])
		@end_user.destroy
		redirect_to manage_end_users_path
	end

	def update
		@end_user = EndUser.find(params[:id])
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
