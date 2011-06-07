class WarcastersController < ApplicationController
  def new
    @model = Model.new
    @model.build_warcaster
    @available_orders = ModelOrder.find(@model.multi_orders)
  end

  def create
    @model = Model.new(params[:model])

    if @model.save
      redirect_to(warcaster_path(@model), :notice => "Model successfully created.")
    else
      render :action => 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
    @model.build_warcaster if @model.warcaster.nil?
    @available_orders = ModelOrder.find(@model.multi_orders)
  end

  def update
    @model = Model.find(params[:id])

    if @model.update_attributes(params[:model])
      redirect_to(warcaster_path(@model), :notice => "Model was successfully updated.")
    else
      render :action => 'edit'
    end
  end

  def show
    @model = Model.find(params[:id])
    @available_weapons = Weapon.order(:name) - @model.weapons
    @available_spells = Spell.order(:name) - @model.spells
  end
end