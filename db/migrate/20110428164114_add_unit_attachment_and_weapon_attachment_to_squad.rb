class AddUnitAttachmentAndWeaponAttachmentToSquad < ActiveRecord::Migration
  def self.up
    add_column :squads, :unit_attachment, :boolean
    add_column :squads, :weapon_attachment, :boolean
  end

  def self.down
    remove_column :squads, :weapon_attachment
    remove_column :squads, :unit_attachment
  end
end
