class AddAttachmentIdToSquads < ActiveRecord::Migration
  def self.up
    add_column :squads, :attachment_id, :integer
  end

  def self.down
    remove_column :squads, :attachment_id
  end
end
