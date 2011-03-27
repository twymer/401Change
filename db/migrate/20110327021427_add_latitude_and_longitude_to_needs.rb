class AddLatitudeAndLongitudeToNeeds < ActiveRecord::Migration
  def self.up
	add_column :needs, :latitude, :real
	add_column :needs, :longitude, :real
  end

  def self.down
	remove_column :needs, :latitude
	remove_column :needs, :longitude
  end
end
