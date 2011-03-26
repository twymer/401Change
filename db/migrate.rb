class CreateNeed < ActiveRecord::Migration
  def self.up
    create_table :needs do |need|
      need.string :description
    end
    add_index :need, :description
  end
  
  def self.down
    drob_table :needs
  end
end