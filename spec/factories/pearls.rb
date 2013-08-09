# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pearl do
    river_id 1
    url "MyString"
    header "MyString"
    summary "MyText"
    image "MyString"
    published_at "2013-08-08 20:11:52"
  end
end
