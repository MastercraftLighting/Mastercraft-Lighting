class UploadsController < ApplicationController

  include IoHelper

  def create
    if params[:vectorworks_file].nil?
      flash[:alert] = "You need to attach a file"
      redirect_to productions_path
      return
    end
    production_id = params[:id]
    begin
      csv_importer(params[:vectorworks_file],production_id)
      redirect_to production_path(production_id) and return
    rescue Exception
      flash[:alert] = "Sorry, your upload failed.  Please check that your file is a TSV format filed from Vectorworks.  If it is the correct file type and does not load, please contact customer support"
      redirect_to productions_path
    end
  end

  def download
    production_id = params[:id]
    csv_exporter(production_id)
    send_file "public/tsv/download_#{production_id}.tsv", :type=>"application/tsv", :x_sendfile=>true
  end

  private

end
