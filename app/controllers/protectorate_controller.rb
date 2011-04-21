class ProtectorateController < ApplicationController
  def index
    @unit_types = UnitType.where("id != 1 AND id != 2 AND id != 3")
    @warcasters = Unit.where("unit_type_id = 1 AND faction_id = 3")
    @warjacks = Unit.where("(unit_type_id = 2 OR unit_type_id = 3) AND faction_id = 3")
    @troops = Unit.where("unit_type_id != 1 AND unit_type_id != 2 AND unit_type_id != 3 AND faction_id = 3")
    
    render 'units/index'
  end
end
