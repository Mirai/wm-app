class SpellsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def new
    @spell = Spell.new

    respond_to do |format|
      format.html
      format.js { render :partial => 'form' }
    end
  end

  def create
    @spell = Spell.new(params[:spell])

    if @spell.save
      respond_to do |format|
        format.html { redirect_to @spell, :notice => "Spell successfully created." }
        format.js
      end
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
      redirect_to @spell, :notice => "Spell successfully updated."
    else
      render :action => 'edit'
    end
  end

  def index
    @spells = Spell.order(:name).page(params[:page])
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
