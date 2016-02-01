class ColorLibrariesController < ApplicationController

  def index
    @colors = ColorLibrary.all
  end

end
