# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :color_library do
    full_name "stringdata"
    alias1 "stringdata"
    alias2 "stringdata"
    description "the below is an integer, this is stringdata"
    transmission 10.5
    hex_code "stringdata"
  end
end
