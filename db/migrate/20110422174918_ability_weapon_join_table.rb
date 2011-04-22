class AbilityWeaponJoinTable < ActiveRecord::Migration
  def self.up
    create_table :abilities_weapons, :id => false do |t|
      t.integer :ability_id
      t.integer :weapon_id
    end
  end

  def self.down
    drop table :abilities_weapons
  end
end
