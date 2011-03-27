class AddNeedIdToActions < ActiveRecord::Migration
  def self.up
	add_column :actions, :need_id, :integer
  end

  def self.down
	remove_column :actions, :need_id
  end
end
