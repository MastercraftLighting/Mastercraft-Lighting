# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160201174742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "color_libraries", force: :cascade do |t|
    t.string   "full_name"
    t.string   "alias1"
    t.string   "alias2"
    t.string   "description"
    t.float    "transmission"
    t.string   "hex_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "csv_inputs", force: :cascade do |t|
    t.text     "device_type"
    t.text     "instrument_type"
    t.text     "wattage"
    t.text     "purpose"
    t.text     "position"
    t.text     "unit_number"
    t.text     "color"
    t.text     "dimmer"
    t.text     "channel"
    t.text     "address"
    t.text     "universe"
    t.text     "u_address"
    t.text     "circuit_number"
    t.text     "circuit_name"
    t.text     "system"
    t.text     "user_field_1"
    t.text     "user_field_2"
    t.text     "user_field_3"
    t.text     "user_field_4"
    t.text     "user_field_5"
    t.text     "user_field_6"
    t.text     "num_channels"
    t.text     "frame_size"
    t.text     "field_angle"
    t.text     "field_angle_2"
    t.text     "beam_angle"
    t.text     "beam_angle_2"
    t.text     "weight"
    t.text     "gobo_1"
    t.text     "gobo_1_rotation"
    t.text     "gobo_2"
    t.text     "gobo_2_rotation"
    t.text     "gobo_shift"
    t.text     "mark"
    t.text     "draw_beam"
    t.text     "draw_beam_as_3d_solid"
    t.text     "use_vertical_beam"
    t.text     "show_beam_at"
    t.text     "falloff_distance"
    t.text     "lamp_rotation_angle"
    t.text     "top_shutter_depth"
    t.text     "top_shutter_angle"
    t.text     "left_shutter_depth"
    t.text     "left_shutter_angle"
    t.text     "right_shutter_depth"
    t.text     "right_shutter_angle"
    t.text     "bottom_shutter_depth"
    t.text     "bottom_shutter_angle"
    t.text     "symbol_name"
    t.text     "use_legend"
    t.text     "flip_front_and_back_legend_text"
    t.text     "flip_left_and_right_legend_text"
    t.text     "focus"
    t.text     "set_3d_orientation"
    t.text     "x_rotation"
    t.text     "y_rotation"
    t.text     "x_location"
    t.text     "y_location"
    t.text     "z_location"
    t.text     "fixtureid"
    t.text     "__uid"
    t.text     "accessories"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "production_id"
  end

  add_index "csv_inputs", ["production_id"], name: "index_csv_inputs_on_production_id", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.text     "instrument_type"
    t.integer  "wattage"
    t.text     "purpose"
    t.text     "position",        default: "0"
    t.text     "unit_number"
    t.text     "color"
    t.integer  "dimmer",          default: 0
    t.integer  "channel",         default: 0
    t.integer  "address"
    t.text     "universe"
    t.integer  "circuit_number",  default: 0
    t.text     "circuit_name",    default: "!"
    t.float    "frame_size"
    t.text     "gobo_1"
    t.text     "gobo_2"
    t.text     "focus"
    t.text     "accessories"
    t.integer  "production_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "equipment_notes", force: :cascade do |t|
    t.text     "note",         null: false
    t.integer  "equipment_id", null: false
    t.string   "field_type",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "equipment_venues", force: :cascade do |t|
    t.integer "equipment_id"
    t.integer "venue_id"
  end

  create_table "leads", force: :cascade do |t|
    t.integer  "production_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string   "name",                  null: false
    t.date     "date"
    t.integer  "designer_id"
    t.integer  "master_electrician_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "productions_venues", force: :cascade do |t|
    t.integer "venue_id"
    t.integer "production_id"
  end

  create_table "unit_libraries", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "unit_type"
    t.string   "unit_name"
    t.string   "beam_angle"
    t.float    "frame_size"
    t.integer  "c_i"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_type",                           null: false
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usertypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
