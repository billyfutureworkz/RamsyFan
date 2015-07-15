
Dish.delete_all

@user = User.create( email: 'user-test-1@example.com', password: 'password', password_confirmation: 'password')

dishes_list = [
  [ "Frozen banana & praline parfait", "This freeze-ahead dinner party dessert", 5, 1, true, @user.id],
  [ "Beef bourguignon", "This sumptuous, step-by-step recipe for slow-cooked stew from Gordon Ramsay " , 6, 3, false, @user.id],
  [ "Chocolate marquise", "this rich chocolate dessert is for serious chocoholics only", 7, 2, true, @user.id ],
  [ "Beef Wellington", "a show-stopping centrepiece on a special occasion", 8, 1, false, @user.id ]
]

dishes_list.each do |title, description, cost, pax, vegetarian, user_id|
  Dish.create( title: title, description: description, cost: cost, pax: pax, vegetarian: vegetarian, user_id: user_id )
end