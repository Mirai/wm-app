class UnitsController < ApplicationController
  def new
    @unit = Unit.new
  end
  
  def create
    @unit = Unit.new(params[:unit])
    
    if @unit.save
      redirect_to @unit, :notice => "Solo created successfully."
    else
      render 'new'
    end
  end
  
  def edit
    @unit = Unit.find(params[:id])
  end
  
  def update
    @unit = Unit.find(params[:id])
    
    if @unit.update_attributes(params[:unit])
      redirect_to @unit, :notice => "Solo updated successfully."
    else
      render 'edit'
    end
  end
  
  def index
    if params[:id].nil?
      @warcasters = Unit.where("unit_type_id = 1").order(:short_name)
      @warjacks = Unit.where("unit_type_id = 2 OR unit_type_id = 3").order(:unit_type_id, :name)
      @troops = Squad.order(:name)
      @solos = Unit.where("unit_type_id = 5").order(:name)
    else
      @warcasters = Unit.where("unit_type_id = 1 AND faction_id = #{params[:id]}").order(:short_name)
      @warjacks = Unit.where("(unit_type_id = 2 OR unit_type_id = 3) AND faction_id = #{params[:id]}").order(:unit_type_id, :name)
      @troops = Squad.where("faction_id = #{params[:id]}").order(:name)
      @solos = Unit.where("unit_type_id = 5 AND faction_id = #{params[:id]}").order(:name)
    end
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
    @equip.hand = params[:equip][:hand]
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
