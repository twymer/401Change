class CreatingNeeds < ActiveRecord::Migration
  def self.up
      create_table :needs do |need|
        need.string :description
      end
  end

  def self.down
   drop_table :needs  
  end
end
