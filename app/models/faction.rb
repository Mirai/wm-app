class Faction < ActiveRecord::Base
  has_many :models

  def self.find_by_url faction_name
    Faction.all.each do |faction|
      return faction if faction.link == faction_name
    end

    return nil
  end

  def self.warmachine
    Faction.find_all_by_game('Warmachine');
  end

  def self.hordes
    Faction.find_all_by_game('Hordes');
  end

  def link
    self.name.gsub(/\s+/, '').downcase
  end
end
