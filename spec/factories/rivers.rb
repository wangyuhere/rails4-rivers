# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :river do
    sequence(:name) { |n| "river-#{n}"}
    sequence(:url) { |n| "http://test.com/channel/#{n}"}
  end
end
