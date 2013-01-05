class Deposit < ActiveRecord::Base
  belongs_to :cook
  
  attr_accessible :amount, :cook, :date
  
  validates :amount,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :cook,
    presence: true
  validates :date,
    presence: true
  validate :date_cannot_be_in_the_future
  
  def amount
    Float(self[:amount] || 0) / 100
  end
  
  def amount=(value)
    value = 0 if value.nil?
    value = Float(value) if value.is_a? String
    value = Integer(value * 100) if value.is_a? Float
    self[:amount] = value
  end
  
  def date_cannot_be_in_the_future
    if !date.blank? and date > Date.today
      errors.add(:date, "can not be in the future")
    end
  end
  
end
