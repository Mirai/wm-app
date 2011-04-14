class UnitsController < ApplicationController
  def new
    @unit = Unit.new
  end
  
  def create
    @unit = Unit.new(params[:unit])
    
    if @unit.save
      redirect_to(@unit, :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end
  
  def edit
    @unit = Unit.find(params[:id])
  end
  
  def update
    @unit = Unit.find(params[:id])
    
    if @unit.update_attributes(params[:unit])
      redirect_to(@unit, :notice => "Unit was successfully updated.")
    else
      render :action => 'edit'
    end
  end
  
  def index
    @units = Unit.all
  end
  
  def show
    @unit = Unit.find(params[:id])
  end
  
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    
    redirect_to(units_url)
  end
end
