require("pry-byebug")
require_relative("./models/category.rb")
require_relative("./models/supplier.rb")

Category.delete_all()

category1 = Category.new({"name" => "Groceries - dry goods"})
category2 = Category.new({"name" => "Fresh Food"})


category1.save()
category2.save()

all = Category.all()

supplier1 = Supplier.new(
  {"name" => "Groceries 2 U", "contact_name" => "Jeff Onions",
    "email" => "orders@groceries2u.com", "phone_number" => "0131 123 4567"})
supplier2 = Supplier.new(
  {"name" => "East Lothian Farms", "contact_name" => "Pete Chicken",
    "email" => "sales@elf.com", "phone_number" => "0131 290 1234"})

supplier1.save()
supplier2.save()

binding.pry
nil
