# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username  'John Lennon'
    password  'TheBeatles'
    password_confirmation 'TheBeatles'
  end
end
