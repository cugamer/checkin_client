class ChangeLatitudeSpelling < ActiveRecord::Migration
  def change
  	remove_column :locations, :lattitude
  	add_column :locations, :latitude, :float
  end
end
