class SessionsController < ApplicationController
  
  skip_before_filter :authenticate, only: [:new, :create]
  
  respond_to :html, :json, :xml
  
  def new
    redirect_to root_url if current_cook
  end
  
  def create
    cook = Cook.find_by_name(params[:name])
    if cook && cook.authenticate(params[:password])
      session[:cook_id] = cook.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid name or password"
      render "new"
    end
  end
  
  def destroy
    session[:cook_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end