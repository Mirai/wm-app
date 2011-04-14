class UnitTypesController < ApplicationController
  def new
    @unit_type = UnitType.new
  end

  def create
    @unit_type = UnitType.new(params[:unit_type])
    
    if @unit_type.save
      redirect_to(unit_types_path, :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end

  def edit
    @unit_type = UnitType.find(params[:id])
  end

  def update
    @unit_type = UnitType.find(params[:id])
    
    if @unit_type.update_attributes(params[:unit_type])
      redirect_to(unit_types_path, :notice => "Unit was successfully updated.")
    else
      render :action => 'edit'
    end
  end

  def index
    @unit_types = UnitType.all
  end

  def destroy
    @unit_type.find(params[:id])
    @unit_type.destroy
    
    redirect_to(unit_types_path)
  end
  
  def cygnar
    @unit_types = UnitType.all
    
    render 'faction'
  end

end
