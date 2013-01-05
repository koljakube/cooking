require 'test_helper'

class CookTest < ActiveSupport::TestCase

  def cook_data
    Struct.new(:name, :email, :password).new('Mal', 'captn@serenity.space', 'f1r3fly')
  end
  
  test "can not be created without a name" do
    cook = cook_data
    @nameless = Cook.create({ email: cook.email, password: cook.password })
    refute @nameless.save
  end

  test "can not be created without an email" do
    cook = cook_data
    @mailless = Cook.create({ name: cook.name, password: cook.password })
    refute @mailless.save
  end

  test "can not be created without a password" do
    cook = cook_data
    @passless = Cook.create({ name: cook.name, email: cook.email })
    refute @passless.save
  end
  
  test "can not be created without a matching password confirmation" do
    cook = cook_data
    @confless = Cook.create({ name: cook.name, email: cook.email, password: cook.password, password_confirmation: cook.password + "_" })
  end
  
  test "can have admin status" do
    assert Cook.find_by_name(cooks(:admin_cook).name).admin?
    refute Cook.find_by_name(cooks(:normal_cook).name).admin?
  end
  
end
