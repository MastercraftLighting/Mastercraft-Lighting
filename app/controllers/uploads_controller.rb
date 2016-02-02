class UploadsController < ApplicationController

  include IoHelper

  def create
    pry
    redirect_to productions_path if params[:vectorworks_file].nil?
    production_id = params[:id]
    csv_importer(params[:vectorworks_file],production_id)
    redirect_to production_path(production_id)
  end

  def download
    production_id = params[:id]
    csv_exporter(production_id)
    send_file "public/tsv/download_#{production_id}.tsv", :type=>"application/tsv", :x_sendfile=>true
  end

  private

end
