class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lattitude, precision: 4
      t.string :hemi_n_s
      t.float :longitude, precision: 4
      t.string :hemi_e_w
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
