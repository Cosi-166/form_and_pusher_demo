# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
<<<<<<< HEAD
=======

puts "creating categories"
Category.destroy_all

books = Category.create(title: "book", description: "Books, Magazines etc.")
electronics = Category.create(title: "electronics", description: "Computer, Cellphone, etc")
clothing = Category.create(title: "clothing", description: "Shoes, Jackets, Belts, etc")[0]
jewelry = Category.create(title: "jewelry", description: "Rings, watches, necklaces, etc")

owners = ["Jane Smith", "Ira Levin", "George Benson"]
colors = ["red", "brown", "green", "white", "tiny"]
clothingnames = ["shoes", "wallet", "belt"]
adjective = ["My favorite", "The perfect", "A great"]

puts "creating sample clothing"
15.times do
  title = colors.sample + " " + clothingnames.sample
  description = adjective.sample + " " + title
  Item.create(title: title, description: description, owner: owners.sample, category: clothing)
end
>>>>>>> d55581b914075feb8d47fc2da6de5cac65f897dc
