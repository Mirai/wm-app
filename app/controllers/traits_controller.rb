class TraitsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def new
    @trait = Trait.new

    respond_to do |format|
      format.html
      format.js { render :partial => 'form' }
    end
  end

  def create
    @trait = Trait.new(params[:trait])

    if @trait.save
      respond_to do |format|
        format.html { redirect_to traits_path, :notice => "Weapon trait successfully added." }
        format.js
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @trait = Trait.find(params[:id])
  end

  def update
    @trait = Trait.find(params[:id])

    if @trait.update_attributes(params[:trait])
      redirect_to traits_path, :notice => "Weapon trait successfully updated."
    else
      render :action => 'edit'
    end
  end

  def index
    @traits = Trait.order(:name).page(params[:page])
  end

  def show
    @trait = Trait.find(params[:id])
  end

  def destroy
    @trait = Trait.find(params[:id])
    @trait.destroy

    redirect_to traits_path
  end
end
