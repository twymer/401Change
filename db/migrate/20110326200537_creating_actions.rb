class CreatingActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |action|
      action.string :description
    end
  end

  def self.down
    drop_table :actions  
  end
end

