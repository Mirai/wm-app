class CryxController < ApplicationController
  def index
    @warcasters = Unit.where("unit_type_id = 1 AND faction_id = 4").order(:short_name)
    @warjacks = Unit.where("(unit_type_id = 2 OR unit_type_id = 3) AND faction_id = 4").order(:unit_type_id, :name)
    @troops = Squad.where("faction_id = 4")
    
    render 'units/index'
  end
end
