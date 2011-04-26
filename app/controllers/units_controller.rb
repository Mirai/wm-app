class UnitsController < ApplicationController
  def index
    @warcasters = Unit.where("unit_type_id = 1").order(:short_name)
    @warjacks = Unit.where("unit_type_id = 2 OR unit_type_id = 3").order(:unit_type_id, :name)
    @troops = Squad.all
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
    @equip = Equip.new
    @equip.unit_id = params[:unit][:id]
    @equip.weapon_id = params[:unit][:weapons]
    @equip.x2 = params[:equip][:x2]
    @equip.save
    
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
