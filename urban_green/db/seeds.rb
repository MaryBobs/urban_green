require_relative("../models/category.rb")

category1 = Category.new("name" => "Groceries - dry goods")
category2 = Category.new("name" => "Fresh Food")
category3 = Category.new("name" => "Frozen")
category4 = Category.new("name" => "Gifts")
category5 = Category.new("name" => "Household")

category1.save()
category2.save()
category3.save()
category4.save()
category5.save()
