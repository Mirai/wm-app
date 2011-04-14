class FactionsController < ApplicationController
  def index
    @factions = Faction.all
  end

end
