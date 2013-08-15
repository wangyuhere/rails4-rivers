# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :river do
    sequence(:name) { |n| "river-#{n}"}
    api_key 'key'
    sequence(:channel_ids) { |n| [n] }
  end
end
