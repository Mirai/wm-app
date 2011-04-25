class WarjacksController < ApplicationController
  def new
    @unit = Unit.new
    @unit.build_warjack
  end
  
  def create
    @unit = Unit.new(params[:unit])
    
    if @unit.save
      redirect_to(warjack_path(@unit), :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end
  
  def edit
    @unit = Unit.find(params[:id])
    @unit.build_warjack if @unit.warjack.nil?
  end
  
  def update
    @unit = Unit.find(params[:id])
    
    if @unit.update_attributes(params[:unit])
      redirect_to(warjack_path(@unit), :notice => "Unit was successfully updated.")
    else
      render :action => 'edit'
    end
  end
  
  def show
    @unit = Unit.find(params[:id])
  end
end