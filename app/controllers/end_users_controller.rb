class EndUsersController < ApplicationController

before_action :authenticate_end_user!
before_action :correct_user, except: [:change_password ]


  def show
 @end_user = EndUser.find(params[:id])
  end

  def edit
 @end_user = EndUser.find(params[:id])
  end

  def update
 @end_user = EndUser.find(params[:id])


 # アカウント編集後、マイページに遷移。ダメだったら、編集画面にレンダー。
 if @end_user.update(end_user_params)
  redirect_to end_user_path
   else
   render :edit
   end
  end

  def change_password
 @end_user = current_end_user
  end


 private
 def end_user_params
     params.require(:end_user).permit(:last_name, :first_name, :last_kana, :first_kana, :postal_code, :address, :phone_number, :email)
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