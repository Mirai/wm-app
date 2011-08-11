class Weapon < ActiveRecord::Base
  include DashToNull

  has_many :equips, :dependent => :destroy
  has_many :models, :through => :equips
  has_and_belongs_to_many :traits

  has_many :warjacks

  def mount?
    return true if self.name == "Mount"
    return false
  end
end
