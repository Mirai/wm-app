class Warcaster < ActiveRecord::Base
  include DashToNull

  belongs_to :model
end
