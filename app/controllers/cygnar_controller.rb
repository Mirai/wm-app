class CygnarController < ApplicationController
  def index
    @warcasters = Unit.where("unit_type_id = 1 AND faction_id = 1").order(:short_name)
    @warjacks = Unit.where("(unit_type_id = 2 OR unit_type_id = 3) AND faction_id = 1").order(:unit_type_id, :name)
    @troops = Squad.where("faction_id = 1").order(:name)
    
    render 'units/index'
  end
end
