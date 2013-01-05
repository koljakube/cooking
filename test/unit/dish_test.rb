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
  
  test "prices are saved as integers, exposed as floats" do
    dish = Dish.create({ name: "Some Dish", price: 1999, date: Date.today })
    assert_equal 19.99, dish.price
    dish.price = 23.45
    assert_equal 23.45, dish.price
    assert_equal 2345, dish[:price]
  end
  
end
