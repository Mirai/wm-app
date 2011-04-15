class FeatsController < ApplicationController
  def new
    @feat = Feat.new
  end
  
  def create
    @feat = Feat.new(params[:feat])
    
    if @feat.save
      redirect_to feats_path, :notice => "Feat successfully created"
    else
      render :action => 'new'
    end
  end
  
  def edit
    @feat = Feat.find(params[:id])
  end
  
  def update
    @feat = Feat.find(params[:id])
    
    if @feat.update_attributes(params[:feat])
      redirect_to feats_path, :notice => "Feat successfully updated"
    else
      render :action => 'edit'
    end
  end
  
  def index
    @feats = Feat.all
  end
  
  def show
    @feat = Feat.find(params[:id])
  end
  
  def destroy
    @feat = Feat.find(params[:id])
    @feat.destroy
    
    redirect_to feats_path
  end
end
