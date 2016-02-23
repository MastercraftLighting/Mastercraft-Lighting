class CreateEquipment < ActiveRecord::Migration

  def change
    create_table :equipment do |t|
      t.text :instrument_type
      t.integer :wattage
      t.text :purpose
      t.text :position, default: 0
      t.text :unit_number
      t.text :color
      t.integer :dimmer, default: 0
      t.integer :channel, default: 0
      t.integer :address
      t.text :universe
      t.text :u_address
      t.integer :circuit_number, default: 0
      t.text :circuit_name, default: '!'
      t.text :system
      t.text :user_field_1
      t.text :user_field_2
      t.text :user_field_3
      t.text :user_field_4
      t.text :user_field_5
      t.text :user_field_6
      t.text :num_channels
      t.float :frame_size
      t.text :field_angle
      t.text :field_angle_2
      t.text :beam_angle
      t.text :beam_angle_2
      t.text :weight
      t.text :gobo_1
      t.text :gobo_1_rotation
      t.text :gobo_2
      t.text :gobo_2_rotation
      t.text :gobo_shift
      t.text :mark
      t.text :draw_beam
      t.text :draw_beam_as_3d_solid
      t.text :use_vertical_beam
      t.text :show_beam_at
      t.text :falloff_distance
      t.text :lamp_rotation_angle
      t.text :top_shutter_depth
      t.text :top_shutter_angle
      t.text :left_shutter_depth
      t.text :left_shutter_angle
      t.text :right_shutter_depth
      t.text :right_shutter_angle
      t.text :bottom_shutter_depth
      t.text :bottom_shutter_angle
      t.text :symbol_name
      t.text :use_legend
      t.text :flip_front_and_back_legend_text
      t.text :flip_left_and_right_legend_text
      t.text :focus
      t.text :set_3d_orientation
      t.text :x_rotation
      t.text :y_rotation
      t.text :x_location
      t.text :y_location
      t.text :z_location
      t.text :fixtureid
      t.text :__uid
      t.references :production
      t.timestamps null: false
    end
  end

end
