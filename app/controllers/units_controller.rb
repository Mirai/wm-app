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
    @unit_types = UnitType.where("id != 1 AND id != 2 AND id != 3")
    @warcasters = Unit.where("unit_type_id = 1")
    @warjacks = Unit.where("unit_type_id = 2 OR unit_type_id = 3")
    @troops = Unit.where("unit_type_id != 1 AND unit_type_id != 2 AND unit_type_id != 3")
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
