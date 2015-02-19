# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)









User.create!(first_name:"test")
Recipe.create! title:"eggs"
Restaurant.create! name:"jago"
Ingredient.create!name:"salt"
Quantity.create! quantity:20, unit: "grams"
r= Recipe.last
u= User.last
i= Ingredient.last
b= Restaurant.last
sr= SavedRecipe.last
q= Quantity.last
sr.user = u
sr.recipe= r
sr.save
u.recipes
r.restaurant = b
r.save
b.recipes
q.ingredient =i
i[0]
