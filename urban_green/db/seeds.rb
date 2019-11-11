require_relative("../models/category.rb")

category1 = Category.new({"name" => "Groceries - dry goods"})
category2 = Category.new({"name" => "Fresh Food"})
category3 = Category.new({"name" => "Frozen"})
category4 = Category.new({"name" => "Gifts"})
category5 = Category.new({"name" => "Household"})

category1.save()
category2.save()
category3.save()
category4.save()
category5.save()

supplier1 = Supplier.new(
  {"name" => "Groceries 2 U", "contact_name" => "Jeff Onions",
    "email" => "orders@groceries2u.com", "phone_number" => "0131 123 4567"})
supplier2 = Supplier.new(
  {"name" => "East Lothian Farms", "contact_name" => "Pete Chicken",
    "email" => "sales@elf.com", "phone_number" => "0131 290 1234"})

supplier1.save()
supplier2.save()
