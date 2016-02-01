class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :update, :destroy, :create, :edit]
  before_action :set_production, only: [:show, :update, :destroy, :create, :edit]

  # def index

  # end

  def create
    @new_thing = Equipment.new(channel: params[:channel], instrument_type: params[:instrument_type],position: params[:position], unit_number: params[:unit_number], purpose: params[:purpose], wattage: params[:wattage], color: params[:color], dimmer: params[:dimmer], address: params[:address], universe:params[:universe], circuit_number: params[:circuit_number],circuit_name: params[:circuit_name], gobo_1: params[:gobo_1], gobo_2: params[:gobo_2], focus: params[:focus], accessories: params[:accessories], production_id: params[:production_id])
    if @new_thing.save
       @equipment = @production.equipment.sort_by &:channel
      render :show
    else
      render :index
    end
  end

  def new

  end

  def edit
    @channel
    @equipment = @production.equipment.sort_by &:channel
    redirect_to production_channel_path
  end

  # def show

  # end
  def update

  end


  def destroy
    item = @production.equipment.find(params[:id])
    item.destroy
    if request.xhr?
      render json: {rowNumber: item.id}
    else
      redirect back
    end
  end

  private

  def set_channel
    equipment = Production.find(params[:production_id])
    @channel = Equipment.find_by(channel: params[:id])
  end

  def set_production
      @production = Production.find(params[:production_id])
  end
  # def channel_params
  #   channel: params[:channel], instrument_type: params[:instrument_type],position: params[:position], unit_number: params[:unit_number], purpose: params[:purpose], wattage: params[:wattage], color: params[:color], dimmer: params[:dimmer], address: params[:address], universe:params[:universe], circuit_number: params[:circuit_number],circuit_name: params[:circuit_name], gobo_1: params[:gobo_1], gobo_2: params[:gobo_2], focus: params[:focus], accessories: params[:accessories], production_id: params[:production_id]
  # end
end
