class ConvertLocationValuesToFloat < ActiveRecord::Migration
  def change
  	remove_column :locations, :lattitude
  	add_column :locations, :lattitude, :float
  	remove_column :locations, :longitude
  	add_column :locations, :longitude, :float
  end
end
