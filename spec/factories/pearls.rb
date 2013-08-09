# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pearl do
    river
    url "http://test.com"
    header "header"
    summary "summary"
    image "test.png"
    published_at Time.now
  end
end
