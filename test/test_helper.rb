ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
    
  def sign_in_as_admin
    session[:cook_id] = cooks(:admin_cook).id
  end
  def sign_in_as_user
    session[:cook_id] = cooks(:normal_cook).id
  end
  def sign_out
    session[:cook_id] = nil
  end
end
