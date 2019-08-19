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
 if @end_user.update_with_password(end_user_params)
  redirect_to end_user_path   #  , notice: 'プロフィールを更新しました'
   else
   render :edit
   end

  end

  def change_password
 @end_user = current_end_user
  end








 private
 def end_user_params
     params.require(:end_user).permit(:password, :password_confirmation, :current_password)
 end


 protected
 def update_resource(resource, params)
   resource.update_without_current_password(params)
 end


end