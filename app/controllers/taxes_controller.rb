class TaxesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tax = Tax.new
    @taxes = Tax.all
  end
  def create
    tax = Tax.new(tax_params)
    if tax.rate.between?(1,100)
      tax.rate = (tax.rate / 100) + 1
      tax.valid_flag = 'off'
      tax.save
      redirect_to taxes_path, :notice => "税率を登録しました。"
    else
      render :index
    end
  end
  def select
    taxes = Tax.all
    tax = Tax.find_by(id: params[:id])
    if !tax.nil? && tax.valid_flag == 'off'
      ActiveRecord::Base.transaction do
        taxes.each do |tax|
          tax.valid_flag = "off"
          tax.save
        end
        tax.valid_flag = "on"
        tax.save
      end
      redirect_to taxes_path, :notice => "税率設定を変更しました。"
    else
      redirect_to taxes_path
    end
  end
  def destroy
    tax = Tax.find(params[:id])
    tax.destroy
    redirect_to taxes_path
  end
  private
  def tax_params
    params.require(:tax).permit(:rate)
  end
end
