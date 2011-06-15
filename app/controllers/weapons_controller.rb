class WeaponsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

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
      respond_to do |format|
        format.html { redirect_to weapons_path, :notice => "Weapon successfully created." }
        format.js
      end
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
      redirect_to @weapon, :notice => "Weapon successfully updated."
    else
      render :action => :edit
    end
  end

  def index
    @weapons = Weapon.order(:name).page(params[:page])
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
