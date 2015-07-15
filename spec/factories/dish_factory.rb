FactoryGirl.define do
  factory :dish do
    title        "spring roll"
    description  "this is a delicious food"
    cost          5
    pax           2
    vegetarian    false
  end

  # factory :invalid_dish do
  #   title         ''
  #   description   "this is a delicious food"
  #   cost          4
  #   pax           1
  #   vegetarian    true
  # end
end