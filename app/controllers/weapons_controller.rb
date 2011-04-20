class WeaponsController < ApplicationController  
  def new
    @weapon = Weapon.new
    
    respond_to do |format|
      format.html
      format.js { render :partial => 'form' }
    end
  end
  
  def create
    @weapon = Weapon.new(params[:weapon])
    
    if @weapon.save
      redirect_to weapons_path, :notice => "Weapon successfully created."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @weapon = Weapon.find(params[:id])
  end
  
  def update
    @weapon = Weapon.find(params[:id])
    
    if(@weapon.update_attributes(params[:weapon]))
      redirect_to weapons_path, :notice => "Weapon successfully updated."
    else
      render :action => :edit
    end
  end
  
  def index
    @weapons = Weapon.order(:name)
  end
  
  def show
    @weapon = Weapon.find(params[:id])
  end
  
  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy
    
    redirect_to weapons_path
  end
end
