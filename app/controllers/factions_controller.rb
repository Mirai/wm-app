class FactionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource

  def index
    @factions = Faction.all
  end

  def edit
  end

  def update
    if @faction.update_attributes(params[:faction])
      redirect_to factions_path, :notice => "Faction updated successfully."
    else
      render :action => 'edit'
    end
  end

  def new
  end

  def create
    if @faction.save(params[:faction])
      redirect_to factions_path, :notice => "Faction created successfully."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @faction.destroy

    redirect_to factions_path
  end
end
