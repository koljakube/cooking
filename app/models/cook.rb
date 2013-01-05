class Cook < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :name, :password, :password_confirmation
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  
  def admin?
    self.admin == true
  end
  
  def self.authenticate(name, password)
    find_by_name(name).try(:authenticate, password)
  end
  
end
