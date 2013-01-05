class CooksController < ApplicationController
  
  respond_to :html, :xml, :json
    
  def index
    @cooks = Cook.all
    respond_with(@cooks)
  end

  def show
    @cook = Cook.find(params[:id])
    respond_with(@cook)
  end

  def new
    @cook = Cook.new
  end
  
  def create
    @cook = Cook.new(params[:cook])
    if @cook.save
      redirect_to @cook, notice: "Created '#{@cook.name}'."
    else
      render "new"
    end
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def update
    @cook = Cook.find(params[:id])

    respond_to do |format|
      if @cook.update_attributes(params[:cook])
        format.html { redirect_to @cook, notice: 'Cook was successfully updated.' }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
        format.xml  { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy

    respond_to do |format|
      format.html { redirect_to cooks_url }
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

end
