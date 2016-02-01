# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'
FactoryGirl.define do
  factory :production do
    name "Production"
    date "02/06/2016"
  end
end
