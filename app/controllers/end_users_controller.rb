class EndUsersController < ApplicationController

before_action :authenticate_end_user!
before_action :correct_user


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
  params.require(:end_user).permit(:first_name, :last_name, :first_kana, :last_kana, :email, :address, :postal_code)
 end


 def correct_user
  user = EndUser.find(params[:id])
  if current_end_user != user
    redirect_to end_user_path(current_end_user)
  end
end


 protected
 def update_resource(resource, params)
   resource.update_without_current_password(params)
 end


end