require 'test_helper'

class DepositTest < ActiveSupport::TestCase
  
  test "can not be created without a cook" do
    deposit = Deposit.create({ amount: 1000, date: Date.today })
    refute deposit.save
  end
  
  test "can not be created without an amount" do
    deposit = Deposit.create({ cook: Cook.first, date: Date.today })
    refute deposit.save
  end
  
  test "can not be created without a date" do
    deposit = Deposit.create({ cook: Cook.first, amount: 1000 })
    refute deposit.save
  end

  test "can not be created with a negative amount" do
    deposit = Deposit.create({ cook: Cook.first, amount: -1000, date: Date.today })
    refute deposit.save
  end
  
  test "can not be created with a date in the future" do
    deposit = Deposit.create({ cook: Cook.first, amount: -1000, date: 3.days.from_now })
    refute deposit.save
  end
  
  test "deposits are saved as integers, exposed as floats" do
    deposit = Deposit.create({ cook: Cook.first, amount: 1999, date: Date.today })
    assert_equal 19.99, deposit.amount
  end
  
end
