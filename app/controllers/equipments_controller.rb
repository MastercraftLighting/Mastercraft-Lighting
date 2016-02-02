class EquipmentsController < ApplicationController
  before_action :set_production, only: [:new, :show, :update, :destroy, :create, :edit]
  before_action :set_equipment, only: [:show, :update, :destroy, :edit]


  def create
    pry-byebug
    @equipment = @production.equipments.build(equipment_params)

    if @equipment.save
       @equipment = @production.equipments.sort_by &:channel
      redirect_to production_path(id: params[:production_id])
    else
      render :index
    end
  end

  def new
    @equipment = @production.equipments.build
    render partial: "new", layout: false
  end

  def edit
      render partial: "edit", layout: false
  end

  def show
    @equipment = @production.equipments.sort_by &:channel
  end

  def update
    p "-" * 40
    p params.inspect
    p "-" * 40
  end


  def destroy
    item = @production.equipments.find(params[:id])
    item.destroy
    if request.xhr?
      render json: {rowNumber: item.id}
    else
      redirect back
    end
  end


  private

  def equipment_params
    params.require(:equipment).permit(:channel, :instrument_type, :position, :unit_number, :purpose, :wattage, :color, :dimmer, :address, :universe, :circuit_number, :circuit_name, :gobo_1, :gobo_2, :focus)
  end

  def set_equipment
    @equipment = Equipment.find(params[:id])

  end

  def set_production
      @production = Production.find(params[:production_id])
  end
end
