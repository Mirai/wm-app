class UnitsController < ApplicationController
  def new
    @unit = Unit.new
    @unit.warcaster = Warcaster.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @unit = Unit.new(params[:unit])
    
    if @unit.unit_type_id == 1
      @unit.warcaster = Warcaster.new(params[:warcaster])
    end
    
    if @unit.save
      redirect_to(@unit, :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end
  
  def edit
    @unit = Unit.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def update
    @unit = Unit.find(params[:id])
    
    if @unit.update_attributes(params[:unit]) && @unit.warcaster.update_attributes(params[:warcaster])
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
    @available_weapons = Weapon.order(:name) - @unit.weapons
    @available_spells = Spell.order(:name) - @unit.spells
  end
  
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    
    redirect_to(units_url)
  end
  
  def add_weapon
    @unit = Unit.find(params[:unit][:id])
    @weapon = Weapon.find(params[:unit][:weapons])
    @unit.weapons << @weapon
    
    respond_to do |format|
      format.html { redirect_to @unit, :notice => "Weapon successfully added." }
      format.js
    end
  end
  
  def add_spell
    @unit = Unit.find(params[:unit][:id])
    @spell = Spell.find(params[:unit][:spells])
    @unit.spells << @spell
    
    respond_to do |format|
      format.html { redirect_to @unit, :notice => "Spell successfully added." }
      format.js
    end
  end
end
