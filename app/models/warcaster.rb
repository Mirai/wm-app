class Warcaster < ActiveRecord::Base
  include DashToNull
  
  belongs_to :unit
end
