class WarcastersController < ApplicationController
  def new
    @unit = Unit.new
    @unit.warcaster = Warcaster.new
  end
  
  def create
    @unit = Unit.new(params[:unit])
    @unit.warcaster = Warcaster.new(params[:warcaster])
    
    if @unit.save
      redirect_to(@unit, :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end
end