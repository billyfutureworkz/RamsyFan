
Dish.delete_all

dishes_list = [
  [ "food1", "this is a description1", 5, 1, true ],
  [ "food2", "this is a description2" , 6, 3, false],
  [ "food3", "this is a description3", 7, 2, true ],
  [ "food4", "this is a description4", 8, 1, false ]
]

dishes_list.each do |title, description, cost, pax, vegetarian|
  Dish.create( title: title, description: description, cost: cost, pax: pax, vegetarian: vegetarian )
end