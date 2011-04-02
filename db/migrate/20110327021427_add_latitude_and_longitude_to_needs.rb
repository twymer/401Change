class AddLatitudeAndLongitudeToNeeds < ActiveRecord::Migration
  def self.up
	add_column :needs, :latitude, :double
	add_column :needs, :longitude, :double
  end

  def self.down
	remove_column :needs, :latitude
	remove_column :needs, :longitude
  end
end
