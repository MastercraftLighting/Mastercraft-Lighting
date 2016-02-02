class CsvInput < ActiveRecord::Base
  belongs_to :production
  after_create :infer_equipment

  def self.build(imported_data,production_id)
    headers = imported_data.shift
    headers.map! do |header|
        header.downcase.gsub(/ /,"_").gsub(/&&/,"and")
    end
    imported_data.each do |line|
        new_record = self.create(production_id: production_id)
        line_params = {production_id: production_id}
        headers.each_with_index do |header, index|
            line_params.update(header => line[index])
        end
        self.create(line_params)
    end
end

    def self.export(production_id) #this may belong in production class I think
        csv_string = CSV.generate do |csv|
            csv << self.attribute_names
            self.where(production_id: production_id).each do |line|
                csv << line.attributes.values
            end
        end
        tsv_string = csv_string.gsub(/,/,"\t")
        File.open("public/tsv/download_#{production_id}.tsv", 'w') {|f| f.write(tsv_string) }
    end

  private
    def infer_equipment
      Equipment.create(
         instrument_type: self.instrument_type,
         wattage: self.wattage,
         purpose: self.purpose,
         position: self.position,
         unit_number: self.unit_number,
         color: self.color,
         dimmer: self.dimmer,
         channel: self.channel,
         address: self.address,
         universe: self.universe,
         circuit_number: self.circuit_number,
         circuit_name: self.circuit_name,
         frame_size: self.frame_size,
         gobo_1: self.gobo_1,
         gobo_2: self.gobo_2,
         focus: self.focus,
         accessories: self.accessories,
         production_id: self.production_id
         )
    end

end
