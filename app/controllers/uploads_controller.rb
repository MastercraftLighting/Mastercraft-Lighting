class UploadsController < ApplicationController
  require 'csv'

  def new
    @production = Production.find(1) # change to real production
  end

  def create
    @production = Production.find(params[:production_id])
    input_string = params[:vectorworks_file].read.force_encoding('MacRoman').encode('UTF-8')
    none_string = input_string.gsub(/\"/, '')
    imported_data = CSV.parse(none_string, :col_sep => "\t")
    CsvInput.build(imported_data,@production.id)
    render "productions/show" #

  end

  private

end
