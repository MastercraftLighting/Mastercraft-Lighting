# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit_library do
    manufacturer "string data"
    unit_type "string data"
    unit_name "string data"
    beam_angle "string data"
    frame_size 7.5
    c_i 0
  end
end
