class CooksController < ApplicationController
  # GET /cooks
  # GET /cooks.json
  def index
    @cooks = Cook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cooks }
    end
  end

  # GET /cooks/1
  # GET /cooks/1.json
  def show
    @cook = Cook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cook }
    end
  end

  # GET /cooks/new
  # GET /cooks/new.json
  def new
    @cook = Cook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cook }
    end
  end

  # GET /cooks/1/edit
  def edit
    @cook = Cook.find(params[:id])
  end

  # POST /cooks
  # POST /cooks.json
  def create
    @cook = Cook.new(params[:cook])

    respond_to do |format|
      if @cook.save
        format.html { redirect_to @cook, notice: 'Cook was successfully created.' }
        format.json { render json: @cook, status: :created, location: @cook }
      else
        format.html { render action: "new" }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cooks/1
  # PUT /cooks/1.json
  def update
    @cook = Cook.find(params[:id])

    respond_to do |format|
      if @cook.update_attributes(params[:cook])
        format.html { redirect_to @cook, notice: 'Cook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooks/1
  # DELETE /cooks/1.json
  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy

    respond_to do |format|
      format.html { redirect_to cooks_url }
      format.json { head :no_content }
    end
  end
end
