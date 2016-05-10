class AddAddressFieldsToLocationModel < ActiveRecord::Migration
  def change
  	add_column :locations, :street_addy, :string
  	add_column :locations, :city, :string
  	add_column :locations, :state, :string
  	add_column :locations, :zip_code, :integer
  end
end
