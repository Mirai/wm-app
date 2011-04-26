class ProtectorateController < ApplicationController
  def index
    @warcasters = Unit.where("unit_type_id = 1 AND faction_id = 3").order(:short_name)
    @warjacks = Unit.where("(unit_type_id = 2 OR unit_type_id = 3) AND faction_id = 3").order(:unit_type_id, :name)
    @troops = Unit.where("unit_type_id != 1 AND unit_type_id != 2 AND unit_type_id != 3 AND faction_id = 3")
    
    render 'units/index'
  end
end
