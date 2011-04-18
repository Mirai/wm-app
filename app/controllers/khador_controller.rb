class KhadorController < ApplicationController
  def index
    @units = Unit.where("faction_id = 2")
    
    render 'units/index'
  end
end
