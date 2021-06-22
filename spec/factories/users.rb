FactoryBot.define do
  factory :user do
    name                  {'山田'}
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a00000'}
    password_confirmation {password}
  end
end