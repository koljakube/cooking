require 'test_helper'

class DishTest < ActiveSupport::TestCase
  
  test "can not be created without a name" do
    dish = Dish.create({ price: 1000, date: Date.today })
    refute dish.save
  end

  test "can not be created without a price" do
    dish = Dish.create({ name: "Some Dish", date: Date.today })
    refute dish.save
  end

  test "can not be created without a date" do
    dish = Dish.create({ name: "Some Dish", price: 1000 })
    refute dish.save
  end
  
  test "price can not be negative" do
    dish = Dish.create({ name: "Some Dish", price: -1000, date: Date.today })
    refute dish.save
  end
  
end
