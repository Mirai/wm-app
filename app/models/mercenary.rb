class Mercenary < ActiveRecord::Base
  belongs_to :model
  belongs_to :merc_faction, :foreign_key => "faction_id"
end