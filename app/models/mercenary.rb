class Mercenary < ActiveRecord::Base
  belongs_to :model
  belongs_to :faction
end