module ProductionsHelper

    def equipment_sorted_sliced_for_channel_view
      result = @production.equipments
      result = result.sort_by.with_index { |item, idx| [item.dimmer, idx]}
      result = result.sort_by.with_index { |item, idx| [item.channel, idx]}
      result = result.slice_when {|a, b| a.channel != b.channel}.to_a
      result
    end

    def equipment_sorted_sliced_for_circuit_view
      result = @production.equipments
      result = result.sort_by.with_index { |item, idx| [item.channel, idx]}
      result = result.sort_by.with_index { |item, idx| [item.dimmer, idx]}
      result = result.sort_by.with_index { |item, idx| [item.circuit_number, idx]}
      result = result.sort_by.with_index { |item, idx| [item.circuit_name, idx]}
      result = result.slice_when {|a, b| a.circuit_name != b.circuit_name}.to_a
      result
    end

    def equipment_sorted_sliced_for_color_view
      result = @production.equipments
      result = result.sort_by.with_index { |item, idx| [item.color, idx]}
      result = result.slice_when {|a, b| a.color != b.color}.to_a
      result
    end

    def equipment_sorted_sliced_for_dimmer_view
      result = @production.equipments
      result = result.sort_by.with_index { |item, idx| [item.circuit_name, idx]}
      result = result.sort_by.with_index { |item, idx| [item.channel, idx]}
      result = result.sort_by.with_index { |item, idx| [item.dimmer, idx]}
      result = result.slice_when {|a, b| a.dimmer != b.dimmer}.to_a
      result
    end

    def equipment_sorted_sliced_for_instrument_view
      result = @production.equipments
      result = result.sort_by.with_index { |item, idx| [item.channel, idx]}
      result = result.sort_by.with_index { |item, idx| [item.unit_number, idx]}
      result = result.sort_by.with_index { |item, idx| [item.position, idx]}
      result = result.slice_when {|a, b| a.position != b.position}.to_a
      result
    end

    def current_production_equipment
      @production.equipments
    end

  private



end
