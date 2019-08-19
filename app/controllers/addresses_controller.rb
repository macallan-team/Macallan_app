class AddressesController < ApplicationController

    def new
        @address = Address.new
    end
    def update
        address =  Address.find(params[:id])
        address.update(address_params)
        redirect_to end_user_addresses_path(current_end_user)
    end
    def edit
        @address = Address.find(params[:id])
    end
    def destroy
        address = Address.find(params[:id])
        address.destroy
    end
    def index
        @addresses = Address.where(end_user_id: current_end_user.id)
    end
    def create
        address = Address.new(address_params)
        address.end_user_id = current_end_user.id
        address.save
        redirect_to end_user_addresses_path(current_end_user)
    end
    def show
        @address = Address.find(params[:id])
    end
    private
    def address_params
    params.require(:address).permit(:name,:address,:postal_code,:phone_number)
    end
end
