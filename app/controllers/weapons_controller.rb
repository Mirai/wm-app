class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end
  
  def new
    @weapon = Weapon.new
  end
  
  def create
    @weapon = Weapon.new(params[:weapon])
    
    if @weapon.save
      redirect_to weapons_path, :notice => "Weapon successfully created."
    else
      render :action => 'new'
    end
  end
end
