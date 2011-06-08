class SubTypesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource

  def new
    @sub_type = SubType.new
  end

  def create
    @sub_type = SubType.new(params[:sub_type])

    if @sub_type.save
      redirect_to(sub_types_path, :notice => "Model successfully created.")
    else
      render :action => 'new'
    end
  end

  def edit
    @sub_type = SubType.find(params[:id])
  end

  def update
    @sub_type = SubType.find(params[:id])

    if @sub_type.update_attributes(params[:sub_type])
      redirect_to(sub_types_path, :notice => "Model was successfully updated.")
    else
      render :action => 'edit'
    end
  end

  def index
    @sub_types = SubType.order(:name)
  end

  def destroy
    @sub_type = SubType.find(params[:id])
    @sub_type.destroy

    redirect_to(sub_types_path)
  end
end
