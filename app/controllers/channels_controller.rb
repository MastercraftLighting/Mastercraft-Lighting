class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :update, :destroy]

  # def index

  # end

  def create

  end

  def new

  end

  def edit

  end

  # def show

  # end
  def update

  end


  # def destroy

  # end

  private

  def set_channel
    equipment = Production.find(params[:production_id])
    @channel = equipment.find_by(channel: params[:id])
  end

end
