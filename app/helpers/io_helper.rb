module IoHelper

require 'csv'

STORED_HEADER_LINE = ["Device Type","Instrument Type","Wattage","Purpose","Position","Unit Number","Color","Dimmer","Channel","Address","Universe","U Address","Circuit Number","Circuit Name","System","User Field 1","User Field 2","User Field 3","User Field 4","User Field 5","User Field 6","Num Channels","Frame Size","Field Angle","Field Angle 2","Beam Angle","Beam Angle 2","Weight","Gobo 1","Gobo 1 Rotation","Gobo 2","Gobo 2 Rotation","Gobo Shift","Mark","Draw Beam","Draw Beam as 3D Solid","Use Vertical Beam","Show Beam at","Falloff Distance","Lamp Rotation Angle","Top Shutter Depth","Top Shutter Angle","Left Shutter Depth","Left Shutter Angle","Right Shutter Depth","Right Shutter Angle","Bottom Shutter Depth","Bottom Shutter Angle","Symbol Name","Use Legend","Flip Front && Back Legend Text","Flip Left && Right Legend Text","Focus","Set 3D Orientation","X Rotation","Y Rotation","X Location","Y Location","Z Location","FixtureID","__UID","Accessories"]

  def csv_importer(file,production_id)
    input_string = file.read.force_encoding('MacRoman').encode('UTF-8')
    none_string = input_string.gsub(/\"/, '')
    imported_data = CSV.parse(none_string, :col_sep => "\t")
    headers = imported_data.shift
    headers.map! do |header|
        header.downcase.gsub(/ /,"_").gsub(/&&/,"and")
    end
    accessory_params = Array.new
    imported_data.each do |line|
      line_params = {production_id: production_id}
      headers.each_with_index do |header, index|
          line_params.update(header => line[index].to_s)
      end
      line_params.delete("accessories")
      line_params = convert_types_of(line_params)
      if line_params["device_type"] == "Light"
        line_params.delete("device_type")
        Equipment.import(line_params)
      else
        line_params.delete("device_type")
        line_params.delete(:production_id)
        accessory_params << line_params
      end
    end
    accessory_params.each do |accessory|
      if Equipment.where(production_id: production_id, position: accessory["position"], unit_number: accessory["unit_number"]).length > 0
        puts Equipment.where(production_id: production_id, position: accessory["position"], unit_number: accessory["unit_number"])
        accessory[:equipment_id] = Equipment.where(production_id: production_id, position: accessory["position"], unit_number: accessory["unit_number"]).first.id
        Accessory.import(accessory)
      else
        accessory[:production_id] = production_id
        Equipment.import(accessory)
      end
    end
  end

  def csv_exporter(production_id)
    csv_string = CSV.generate do |csv|
      csv << STORED_HEADER_LINE
      Production.find(production_id).equipments.each do |line|
        csv << (["Light"] + line.attributes.values + [""])
        if line.accessories
          line.accessories.each do |line|
            csv << (["Static Accessory"] + line.attributes.values + [""])
          end
        end
      end
    end
    tsv_string = csv_string.gsub(/,/,"\t")
    File.open("public/tsv/download_#{production_id}.tsv", 'w') {|f| f.write(tsv_string) }
  end

  private

  def convert_types_of(line_params)
    line_params['wattage'] = line_params['wattage'].to_i
    line_params['dimmer'] = line_params['dimmer'].to_i
    line_params['channel'] = line_params['channel'].to_i
    line_params['address'] = line_params['address'].to_i
    line_params['circuit_number'] = line_params['circuit_number'].to_i
    line_params['frame_size'] = line_params['frame_size'].to_f
    line_params
  end


end
