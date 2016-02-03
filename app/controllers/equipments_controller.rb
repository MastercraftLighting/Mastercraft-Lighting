class EquipmentsController < ApplicationController
  before_action :set_production, only: [:new, :show, :update, :destroy, :create, :edit]
  before_action :set_equipment, only: [:show, :update, :destroy, :edit]

include ProductionsHelper

  def create
    @equipment = @production.equipments.build(equipment_params)
    if @equipment.save
      @accessory = @equipment.accessories.create(instrument_type: params[:equipment][:accessories_list]) unless params[:equipment][:accessories_list] == ""
      view_sorted_data
      render "productions/show", layout: false
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
    @colors = ColorLibrary.all
  end

  def update
    if @equipment.update_attributes(equipment_params)
      accessories_list.each{|accessory| @equipment.accessories.find_or_create_by(instrument_type: accessory)}
      # @equipment = @production.equipments.sort_by &:channel
      view_sorted_data
      render "productions/show", layout: false
    else
    end
  end


  def destroy
    if @equipment.destroy
      # @equipment = @production.equipments.sort_by &:channel
      view_sorted_data
      render "productions/show", layout: false
    else
      redirect back
    end
  end


  private

  def accessories_list
    params[:equipment][:accessories_list].gsub(/\s/,"").split(",")
  end

  def view_sorted_data
    @colors = ColorLibrary.all
    @equipment_sorted_sliced_for_channel_view = equipment_sorted_sliced_for_channel_view
    @equipment_sorted_sliced_for_circuit_view = equipment_sorted_sliced_for_circuit_view
    @equipment_sorted_sliced_for_color_view = equipment_sorted_sliced_for_color_view
    @equipment_sorted_sliced_for_dimmer_view = equipment_sorted_sliced_for_dimmer_view
    @equipment_sorted_sliced_for_instrument_view = equipment_sorted_sliced_for_instrument_view
  end

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
