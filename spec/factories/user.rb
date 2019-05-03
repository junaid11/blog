FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    name { 'abc' }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.yesterday }
  end
end
