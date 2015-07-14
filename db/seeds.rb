
Dish.delete_all

dishes_list = [
  [ "Frozen banana & praline parfait", "This freeze-ahead dinner party dessert", 5, 1, true ],
  [ "Beef bourguignon", "This sumptuous, step-by-step recipe for slow-cooked stew from Gordon Ramsay " , 6, 3, false],
  [ "Chocolate marquise", "this rich chocolate dessert is for serious chocoholics only", 7, 2, true ],
  [ "Beef Wellington", "a show-stopping centrepiece on a special occasion", 8, 1, false ]
]

dishes_list.each do |title, description, cost, pax, vegetarian|
  Dish.create( title: title, description: description, cost: cost, pax: pax, vegetarian: vegetarian )
end