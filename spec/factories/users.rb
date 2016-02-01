# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    email "user@user.com"
    username 'username'
    password 'password'
  end

  trait :admin do
    user_type "Administrator"
  end

  trait :designer do
    user_type "Designer"
  end

end

