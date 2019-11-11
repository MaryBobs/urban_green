require_relative("../models/category.rb")
require_relative("../models/supplier.rb")
require_relative("../models/product.rb")
require_relative("../models/stock.rb")

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

product1 = Product.new(
  {"name" => "eggs", "description" => "6 per box", "category_id" => 2})

product2 = Product.new(
  {"name" => "tinned beans", "description" => "mixed beans", "category_id" => 1})

product1.save()
product2.save()

stock1 = Stock.new(
  {"product_id" => 1, "supplier_id" => 2, "stock_quantity" => 200, "buying_cost" => 0.80, "selling_price" => 1.20})

stock2 = Stock.new(
  {"product_id" => 2, "supplier_id" => 1, "stock_quantity" => 500, "buying_cost" => 0.60, "selling_price" => 0.90})

stock1.save()
stock2.save()
