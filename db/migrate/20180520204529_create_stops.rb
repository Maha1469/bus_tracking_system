class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.integer :stop_number
      t.integer :bus_id

      t.timestamps
    end
  end
end
