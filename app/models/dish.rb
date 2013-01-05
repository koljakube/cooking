class Dish < ActiveRecord::Base
  attr_accessible :name, :price, :date
  
  validates :name,
    presence: true
  validates :price,
    presence: true,
    numericality: { integer_only: true, greater_than: 0 }
  validates :date,
    presence: true
  
  def price
    Float(self[:price] || 0) / 100
  end
  
  def price=(value)
    value = 0 if value.nil?
    value = Float(value) if value.is_a? String
    value = Integer(value * 100) if value.is_a? Float
    self[:price] = value
  end
end
