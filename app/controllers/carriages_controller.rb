class CarriagesController < ApplicationController
 
  def index
    @carriage = Carriage.new
    @carriages = Carriage.all
  end
  def create
    carriage = Carriage.new(carriage_params)
      carriage.valid_flag = 'off'
      carriage.save
      redirect_to carriages_path
  end
  def select
    carriages = Carriage.all
    carriage = Carriage.find_by(id: params[:id])
    if !carriage.nil? && carriage.valid_flag == 'off'
      ActiveRecord::Base.transaction do
        carriages.each do |carriage|
          carriage.valid_flag = "off"
          carriage.save
        end
        carriage.valid_flag = "on"
        carriage.save
      end
      redirect_to carriages_path
    else
      redirect_to carriages_path
    end
  end
  def destroy
    carriage = Carriage.find(params[:id])
    carriage.destroy
    redirect_to carriages_path
  end
  private
  def carriage_params
    params.require(:carriage).permit(:rate)
  end
end
