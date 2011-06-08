class ModelsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def new
    @model = Model.new
    @available_orders = ModelOrder.find(@model.multi_orders)
  end

  def create
    @model = Model.new(params[:model])

    if @model.save
      redirect_to @model, :notice => "Solo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
    @available_orders = ModelOrder.find(@model.multi_orders)
  end

  def update
    @model = Model.find(params[:id])

    if @model.update_attributes(params[:model])
      redirect_to @model, :notice => "Solo updated successfully."
    else
      render 'edit'
    end
  end

  def index
    if params[:id].nil?
      @warcasters = Model.order(:short_name).find_all_by_model_type_id(1)
      @warjacks = Model.order(:model_type_id, :name).find_all_by_model_type_id_and_parent_id([2, 3], nil)
      @troops = Unit.order(:name)
      @solos = Model.order(:name).find_all_by_model_type_id_and_parent_id(5, nil)
    else
      @warcasters = Model.order(:short_name).find_all_by_model_type_id_and_faction_id(1, params[:id])
      @warjacks = Model.order(:model_type_id, :name).find_all_by_model_type_id_and_parent_id_and_faction_id([2, 3], nil, params[:id])
      @troops = Unit.order(:name).find_all_by_faction_id(params[:id])
      @solos = Model.order(:name).find_all_by_model_type_id_and_parent_id_and_faction_id(5, nil, params[:id])
    end
  end

  def show
    @model = Model.find(params[:id])
    @available_weapons = Weapon.order(:name) - @model.weapons
    @available_spells = Spell.order(:name) - @model.spells
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    redirect_to(models_url)
  end

  def add_weapon
    @equip = Equip.new
    @equip.model_id = params[:model][:id]
    @equip.weapon_id = params[:model][:weapons]
    @equip.hand = params[:equip][:hand]
    @equip.x2 = params[:equip][:x2]
    @equip.save

    respond_to do |format|
      format.html { redirect_to @model, :notice => "Weapon successfully added." }
      format.js
    end
  end

  def add_spell
    @model = Model.find(params[:model][:id])
    @spell = Spell.find(params[:model][:spells])
    @model.spells << @spell

    respond_to do |format|
      format.html { redirect_to @model, :notice => "Spell successfully added." }
      format.js
    end
  end

  def remove_weapon
    @model = Model.find(params[:id])
    @removed_weapon = Equip.find_by_model_id_and_weapon_id(params[:id], params[:weapon_id])

    @model.equips.delete(@removed_weapon)

    respond_to do |format|
      format.html { redirect_to @model, :notice => "Weapon successfully removed." }
      format.js
    end
  end

  def remove_spell
    @model = Model.find(params[:id])
    @removed_spell = Spell.find(params[:spell_id])

    @model.spells.delete(@removed_spell)

    respond_to do |format|
      format.html { redirect_to @model, :notice => "Spell successfully removed." }
      format.js
    end
  end
end
