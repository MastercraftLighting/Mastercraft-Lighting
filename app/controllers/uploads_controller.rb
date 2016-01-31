class UploadsController < ApplicationController
  require 'csv'

  def create
    puts "greetings from uploads#create"
    input_string = params[:vectorworks_file].read.force_encoding('MacRoman').encode('UTF-8')
    none_string = input_string.gsub(/\"/, '')
    data = CSV.parse(none_string, :col_sep => "\t")
    # save_new_CSV_upload(data)
    redirect_to root_path
  end

  def new
    puts "greetings from uploads#new"
  end

  private

end
