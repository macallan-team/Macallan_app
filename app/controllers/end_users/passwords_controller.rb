# frozen_string_literal: true

class EndUsers::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end



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
        params.require(:end_user).permit(:reset_password_token, :password, :password_confirmation, :current_password)
    end


    protected
    # def update_resource(resource, params)
    #   resource.update_without_current_password(params)
    # end

    def update_resource(resource, params)
      return super if params["password"]&.present?
      resource.update_without_password(params.except("current_password"))
    end


end
