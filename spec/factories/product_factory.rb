FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    id
    name "New Bike"
    image_url "some url"
    colour "red"
    price "3000"
  end
end
