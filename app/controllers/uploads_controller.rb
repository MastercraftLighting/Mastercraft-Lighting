class UploadsController < ApplicationController
  require 'csv'

  def create
    puts "greetings from uploads#create"
    input_string = params[:vectorworks_file].read.force_encoding('MacRoman').encode('UTF-8')
    none_string = input_string.gsub(/\"/, '')
    data = CSV.parse(none_string, :col_sep => "\t")
    data.delete(data[0])
    data.each do |data_row|
      CsvInput.create(
        device_type: data_row[0],
        instrument_type: data_row[1],
        wattage: data_row[2],
        purpose: data_row[3],
        position: data_row[4],
        unit_number: data_row[5],
        color: data_row[6],
        dimmer: data_row[7],
        channel: data_row[8],
        address: data_row[9],
        universe: data_row[10],
        u_address: data_row[11],
        circuit_number: data_row[12],
        circuit_name: data_row[13],
        system: data_row[14],
        user_field_1: data_row[15],
        user_field_2: data_row[16],
        user_field_3: data_row[17],
        user_field_4: data_row[18],
        user_field_5: data_row[19],
        user_field_6: data_row[20],
        num_channels: data_row[21],
        frame_size: data_row[22],
        field_angle: data_row[23],
        field_angle_2: data_row[24],
        beam_angle: data_row[25],
        beam_angle_2: data_row[26],
        weight: data_row[27],
        gobo_1: data_row[28],
        gobo_1_rotation: data_row[29],
        gobo_2: data_row[30],
        gobo_2_rotation: data_row[31],
        gobo_shift: data_row[32],
        mark: data_row[33],
        draw_beam: data_row[34],
        draw_beam_as_3d_solid: data_row[35],
        use_vertical_beam: data_row[36],
        show_beam_at: data_row[37],
        falloff_distance: data_row[38],
        lamp_rotation_angle: data_row[39],
        top_shutter_depth: data_row[40],
        top_shutter_angle: data_row[41],
        left_shutter_depth: data_row[42],
        left_shutter_angle: data_row[43],
        right_shutter_depth: data_row[44],
        right_shutter_angle: data_row[45],
        bottom_shutter_depth: data_row[46],
        bottom_shutter_angle: data_row[47],
        symbol_name: data_row[48],
        use_legend: data_row[49],
        flip_front_and_back_legend_text: data_row[50],
        flip_left_and_right_legend_text: data_row[51],
        focus: data_row[52],
        set_3d_orientation: data_row[53],
        x_rotation: data_row[54],
        y_rotation: data_row[55],
        x_location: data_row[56],
        y_location: data_row[57],
        z_location: data_row[58],
        fixtureid: data_row[59],
        __uid: data_row[60],
        accessories: data_row[61]
      )
    end
    redirect_to root_path
  end

  def new
    puts "greetings from uploads#new"
  end

  private

end
