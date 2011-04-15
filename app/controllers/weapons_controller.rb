class WeaponsController < ApplicationController  
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
  
  def index
    @weapons = Weapon.order(:name)
  end
  
  def show
    @weapon = Weapon.find(params[:id])
  end
end
