class CygnarController < ApplicationController
  def index
    @units = Unit.where("faction_id = 1")
    
    render 'units/index'
  end
end
