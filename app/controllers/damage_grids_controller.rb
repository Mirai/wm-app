class DamageGridsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def new
    @grid = DamageGrid.new
  end

  def create
    @grid = DamageGrid.new(params[:damage_grid])

    if @grid.save
      redirect_to @grid, :notice => "Damage Grid created successfully."
    else
      render 'new'
    end
  end

  def edit
    @grid = DamageGrid.find(params[:id])
  end

  def update
    @grid = DamageGrid.find(params[:id])

    if @grid.update_attributes(params[:damage_grid])
      redirect_to @grid, :notice => "Damage Grid updated successfully"
    else
      render 'edit'
    end
  end

  def index
    @grids = DamageGrid.order(:name)

    respond_to do |format|
      format.html
      format.js { @grid = DamageGrid.find(params[:id]) }
    end
  end

  def show
    @grid = DamageGrid.find(params[:id])
  end

  def destroy
    @grid = DamageGrid.find(params[:id])
    @grid.destroy

    redirect_to damage_grids_path
  end
end
