class UploadsController < ApplicationController
  require 'csv'

  def create
    @production = Production.find(params[:id])
    input_string = params[:vectorworks_file].read.force_encoding('MacRoman').encode('UTF-8')
    none_string = input_string.gsub(/\"/, '')
    imported_data = CSV.parse(none_string, :col_sep => "\t")
    CsvInput.build(imported_data,@production.id)
    redirect_to production_path(@production.id)
  end

  def download
    production_id = params[:id]
    CsvInput.export(production_id)
    send_file "public/tsv/download_#{production_id}.tsv", :type=>"application/tsv", :x_sendfile=>true
  end

  private

end
