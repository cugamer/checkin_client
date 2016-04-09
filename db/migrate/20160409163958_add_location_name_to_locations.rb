class AddLocationNameToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :location_title, :string
  end
end
