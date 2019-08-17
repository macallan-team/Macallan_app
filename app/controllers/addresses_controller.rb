class AddressesController < ApplicationController

    def new
        @address = Address.new
    end
    def update
        address =  Address.find(params[:id])
        address.update(address_params)
        redirect_to addresses_path
    end
    def edit
        @address = Address.find(params[:id])
    end
    def destroy
        address = Address.find(params[:id])
        address.destroy
    end
    def index
        @addresses = Address.all
    end
    def create
        address = Address.new(address_params)
        address.save
    end
    def show
        @address = Address.find(params[:id])
    end
    private
    def address_params
    params.require(:address).permit(:name,:address,:postal_code,:phone_number)
    end
end
