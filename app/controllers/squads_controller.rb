class SquadsController < ApplicationController
  def new
    @squad = Squad.new
    3.times { @squad.units.build }
  end
  
  def create
    @squad = Squad.new(params[:squad])
    
    if @squad.save
      redirect_to(@squad, :notice => "Squad successfully created.")
    else
      render :action => 'new'
    end
  end
  
  def edit
    @squad = Squad.find(params[:id])
  end
  
  def update
    @squad = Squad.find(params[:id])
    
    if @squad.update_attributes(params[:unit])
      redirect_to(@squad, :notice => "Unit was successfully updated.")
    else
      render :action => 'edit'
    end
  end
  
  def show
    @squad = Squad.find(params[:id])
  end
end