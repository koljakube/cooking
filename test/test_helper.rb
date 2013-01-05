ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
    
  def sign_in_as_admin
    session[:cook_id] = Cook.find_by_name(cooks(:admin_cook).name).id
  end
  def sign_in_as_user
    session[:cook_id] = Cook.find_by_name(cooks(:normal_cook).name).id
  end
  def sign_out
    session[:cook_id] = nil
  end
end
