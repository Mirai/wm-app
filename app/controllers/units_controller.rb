class UnitsController < ApplicationController
  def new
    @unit = Unit.new
    @unit.models.build
    @available_orders = ModelOrder.find_all_by_model_id(@unit.model_ids)
  end

  def create
    @unit = Unit.new(params[:unit])

    if @unit.save
      redirect_to(@unit, :notice => "Unit successfully created.")
    else
      render :action => 'new'
    end
  end

  def edit
    @unit = Unit.find(params[:id])
    @available_orders = ModelOrder.find_all_by_model_id(@unit.model_ids)
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update_attributes(params[:unit])
      redirect_to(@unit, :notice => "Model was successfully updated.")
    else
      render :action => 'edit'
    end
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    redirect_to models_path
  end
end