class ModelTypesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @model_type = ModelType.new
  end

  def create
    @model_type = ModelType.new(params[:model_type])

    if @model_type.save
      redirect_to(model_types_path, :notice => "Model successfully created.")
    else
      render :action => 'new'
    end
  end

  def edit
    @model_type = ModelType.find(params[:id])
  end

  def update
    @model_type = ModelType.find(params[:id])

    if @model_type.update_attributes(params[:model_type])
      redirect_to(model_types_path, :notice => "Model was successfully updated.")
    else
      render :action => 'edit'
    end
  end

  def index
    @model_types = ModelType.all
  end

  def destroy
    @model_type = ModelType.find(params[:id])
    @model_type.destroy

    redirect_to(model_types_path)
  end

end
