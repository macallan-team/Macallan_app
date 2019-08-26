class AddressesController < ApplicationController
    before_action :authenticate_end_user!
    def new
        @address = Address.new
    end
    def update
        @address =  Address.find(params[:id])
        if @address.update(address_params)
            redirect_to new_end_user_order_path(current_end_user),notice: '配送先を更新しました。'
        else
            flash.now[:alert] = "登録に失敗しました。入力内容をご確認ください。"
            render :edit
        end
    end
    def edit
        @address = Address.find(params[:id])
    end
    def destroy
        address = Address.find(params[:id])
        address.destroy
        redirect_to new_end_user_order_path(current_end_user),alert: '配送先を削除しました。'
    end
    def create
        @address = Address.new(address_params)
        @address.end_user_id = current_end_user.id
        if @address.save
            redirect_to new_end_user_order_path(current_end_user),notice: '配送先を作成しました。'
        else
            flash.now[:alert] = "登録に失敗しました。入力内容をご確認ください。"
            render :new
        end
    end
    private
    def address_params
    params.require(:address).permit(:name,:address,:postal_code,:phone_number)
    end
end
