class WarjacksController < ApplicationController
  def new
    @unit = Unit.new
    @unit.warjack = Warjack.new
  end
  
  def create
    @unit = Unit.new(params[:unit])
    @unit.warjack = Warjack.new(params[:warcaster])
    
    if @unit.save
      redirect_to(@unit, :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end
end