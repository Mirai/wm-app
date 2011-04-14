class SpellsController < ApplicationController
  def index
    @spells = Spell.all
  end
end
