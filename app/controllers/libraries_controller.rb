class LibrariesController < ApplicationController

  def index
    render :index
  end

  def show
    if params[:id] == 'colors'
      @colors = ColorLibrary.all
      render :colors
    elsif params[:id] == "equipment"
      @units = UnitLibrary.all
      render :equipment
    end
  end

end
