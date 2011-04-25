class UnitsController < ApplicationController
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
