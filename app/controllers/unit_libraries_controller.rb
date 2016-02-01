class UnitLibrariesController < ApplicationController

  def index
    @units = UnitLibrary.all
  end

end
