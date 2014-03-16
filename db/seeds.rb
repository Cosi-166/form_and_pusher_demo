# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "creating categories"

books = Category.create(title: "book", description: "Books, Magazines etc.")
electronics = Category.create(title: "electronics", description: "Computer, Cellphone, etc")
clothing = Category.create(title: "clothing", description: "Shoes, Jackets, Belts, etc")[0]
jewelry = Category.create(title: "jewelry", description: "Rings, watches, necklaces, etc")

owners = ["Jane Smith", "Ira Levin", "George Benson"]
colors = ["Red", "Brown", "Green", "White"]
clothingnames = ["Shoes", "Wallet", "Belt"]
adjective = ["favorite", "perfect", "great"]

# creating sample clothing
5.times do
  title = colors.sample + " " + clothingnames.sample
  description = adjective.sample + " " + title
  Item.create(title: title, description: description, owner: owners.sample, category: clothing)
end
