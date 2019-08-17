class EndUsersController < ApplicationController

# before_action :authenticate_admin!

  def show
 @end_user = EndUser.find(params[:id])
  end

  def edit
 @end_user = EndUser.find(params[:id])
  end

  def update
 @end_user = EndUser.find(params[:id])

 # アカウント編集後、マイページに遷移
 if @end_user.update(end_user_params)
   redirect_to end_user_path, notice: 'プロフィールを更新しました'
   else
   render :edit
   end
 end



 private
 def end_user_params
     params.require(:end_user).permit(:last_name,
     :first_name, :last_kana, :first_kana, :postal_code, :address, :phone_number)
 end



end