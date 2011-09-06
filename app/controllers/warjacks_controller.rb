class WarjacksController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def new
    @model = Model.new
    @model.build_warjack
    authorize! :create, @model
  end

  def create
    @model = Model.new(params[:model])
    authorize! :create, @model

    if @model.save
      redirect_to(warjack_path(@model), :notice => "Model successfully created.")
    else
      render :action => 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
    @model.build_warjack if @model.warjack.nil?
    authorize! :update, @model
  end

  def update
    @model = Model.find(params[:id])
    authorize! :update, @model

    if @model.update_attributes(params[:model])
      redirect_to(warjack_path(@model), :notice => "Model was successfully updated.")
    else
      render :action => 'edit'
    end
  end

  def show
    @model = Model.find(params[:id])
  end
end