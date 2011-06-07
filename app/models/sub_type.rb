class SubType < ActiveRecord::Base
  has_many :models
  has_many :units
end
