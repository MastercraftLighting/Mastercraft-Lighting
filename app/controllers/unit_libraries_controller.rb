class UnitLibrariesController < ApplicationController

  def index
    @units = UnitLibrary.all
  end

  def library_index
    render :library_index
  end

end
