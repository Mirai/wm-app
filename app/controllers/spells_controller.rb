class SpellsController < ApplicationController
  def new
    @spell = Spell.new
  end
  
  def create
    @spell = Spell.new(params[:spell])
    
    if @spell.save
      redirect_to spells_path, :notice => "Spell successfully created."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @spell = Spell.find(params[:id])
  end
  
  def update
    @spell = Spell.find(params[:id])
    
    if @spell.update_attributes(params[:spell])
      redirect_to spells_path, :notice => "Spell successfully updated."
    else
      render :action => 'edit'
    end
  end
  
  def index
    @spells = Spell.all
  end
  
  def show
    @spell = Spell.find(params[:id])
  end
  
  def destroy
    @spell = Spell.find(params[:id])
    @spell.destroy
    
    redirect_to spells_path
  end
    
end
