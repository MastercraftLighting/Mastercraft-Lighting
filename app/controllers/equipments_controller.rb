class EquipmentsController < ApplicationController
  before_action :set_production, only: [:new, :show, :update, :destroy, :create, :edit]
  before_action :set_equipment, only: [:show, :update, :destroy, :edit]


  def create
    @colors = ColorLibrary.all
    @equipment = @production.equipments.build(equipment_params)
    if @equipment.save
      @equipment = @production.equipments.sort_by &:channel
      render "productions/show", layout: false
    else
      render :index
    end
  end

  def new
    @colors = ColorLibrary.all
    @equipment = @production.equipments.build
    render partial: "new", layout: false
  end

  def edit
      render partial: "edit", layout: false
  end

  def show
    @equipment = @production.equipments.sort_by &:channel
    @colors = ColorLibrary.all
  end

  def update
    if @equipment.update_attributes(equipment_params)
      @equipment = @production.equipments.sort_by &:channel
      render "productions/show", layout: false
    else
    end
  end


  def destroy
    if @equipment.destroy
      @equipment = @production.equipments.sort_by &:channel
      render "productions/show", layout: false
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
