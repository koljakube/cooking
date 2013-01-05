class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  private
  
  def authenticate
    redirect_to sign_in_path, alert: "You must be logged in to view the pages!" if current_cook.nil?
  end
  
  def current_cook
    @current_cook ||= Cook.find(session[:cook_id]) if session[:cook_id]
  end
  helper_method :current_user
end
