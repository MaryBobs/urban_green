require("pry-byebug")
require_relative("./models/category.rb")

Category.delete_all()

category1 = Category.new({"name" => "Groceries - dry goods"})
category2 = Category.new({"name" => "Fresh Food"})


category1.save()
category2.save()

all = Category.all()

binding.pry
nil
