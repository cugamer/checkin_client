class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :lattitude
      t.string :hemi_n_s
      t.string :longitude
      t.string :hemi_e_w
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
