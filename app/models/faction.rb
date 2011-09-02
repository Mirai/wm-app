class Faction < ActiveRecord::Base
  has_many :models
  has_many :mercenaries
  has_many :models, :through => :mercenaries

  scope :warmachine, :conditions => { :game => "Warmachine" }
  scope :hordes, :conditions => { :game => "Hordes" }

  def self.find_by_url faction_name
    Faction.all.each do |faction|
      return faction if faction.link == faction_name
    end

    return nil
  end

  def link
    self.name.gsub(/\s+/, '').downcase
  end
end
