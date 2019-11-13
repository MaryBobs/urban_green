require_relative("../models/category.rb")
require_relative("../models/supplier.rb")
require_relative("../models/product.rb")
require_relative("../models/stock.rb")

category1 = Category.new({"name" => "Groceries"})
category2 = Category.new({"name" => "Fresh"})
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
supplier3 = Supplier.new(
      {"name" => "Gifts Express", "contact_name" => "Amy Apple",
        "email" => "amy@giftexpress.com", "phone_number" => "0131 321 1234"})

supplier1.save()
supplier2.save()
supplier3.save()

product1 = Product.new(
  {"name" => "Eggs", "description" => "6 per box", "category_id" => 2})

product2 = Product.new(
  {"name" => "Tinned tomatoes", "description" => "chopped tomatoes", "category_id" => 1})

product2 = Product.new(
  {"name" => "Milk", "description" => "2 pints", "category_id" => 2})

product1 = Product.new(
  {"name" => "Pizza", "description" => "Frozen cheese pizza", "category_id" => 3})

product2 = Product.new(
  {"name" => "Apples", "description" => "5 per bag", "category_id" => 2})

product2 = Product.new(
  {"name" => "Birthday cards", "description" => "pack of 3", "category_id" => 4})

product1.save()
product2.save()
product3.save()
product4.save()
product5.save()
product6.save()

stock1 = Stock.new(
  {"product_id" => 1, "supplier_id" => 2, "stock_quantity" => 200, "buying_cost" => 0.80, "selling_price" => 1.20})

stock2 = Stock.new(
  {"product_id" => 2, "supplier_id" => 1, "stock_quantity" => 500, "buying_cost" => 0.60, "selling_price" => 0.90})

stock1.save()
stock2.save()
