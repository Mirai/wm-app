class WarcastersController < ApplicationController
  def new
    @unit = Unit.new
    @unit.build_warcaster
    @available_orders = UnitOrder.find(@unit.multi_orders)
  end
  
  def create
    @unit = Unit.new(params[:unit])
    
    if @unit.save
      redirect_to(warcaster_path(@unit), :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end
  
  def edit
    @unit = Unit.find(params[:id])
    @unit.build_warcaster if @unit.warcaster.nil?
    @available_orders = UnitOrder.find(@unit.multi_orders)
  end
  
  def update
    @unit = Unit.find(params[:id])
    
    if @unit.update_attributes(params[:unit])
      redirect_to(warcaster_path(@unit), :notice => "Unit was successfully updated.")
    else
      render :action => 'edit'
    end
  end
  
  def show
    @unit = Unit.find(params[:id])
    @available_weapons = Weapon.order(:name) - @unit.weapons
    @available_spells = Spell.order(:name) - @unit.spells
  end
end