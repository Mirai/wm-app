class AbilitiesController < ApplicationController
  def new
    @ability = Ability.new
  end
  
  def create
    @ability = Ability.new(params[:ability])
    
    if @ability.save
      redirect_to abilities_path, :notice => "Weapon ability successfully added."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ability = Ability.find(params[:id])
  end
  
  def update
    @ability = Ability.find(params[:id])
    
    if @ability.update_attributes(params[:ability])
      redirect_to abilities_path, :notice => "Weapon ability successfully updated."
    else
      render :action => 'edit'
    end
  end
  
  def index
    @abilities = Ability.order(:name).page(params[:page])
  end
  
  def show
    @ability = Ability.find(params[:id])
  end
  
  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy
    
    redirect_to abilities_path
  end
end
