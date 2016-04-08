class AddBusinessValuesToClients < ActiveRecord::Migration
  def change
    add_column :clients, :business_name, :string

    add_index :clients, :business_name, unique: true
  end
end
