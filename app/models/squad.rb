class Squad < ActiveRecord::Base
  belongs_to :faction
  has_and_belongs_to_many :units
end
