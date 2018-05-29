class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.float :current_lat
      t.float :current_lan
      t.float :starting_lat
      t.float :starting_lan
      t.float :ending_lat
      t.float :ending_lan
      t.text :description
      t.time :evening_start_time
      t.time :evening_end_time
      t.time :morning_start_time
      t.time :morning_end_time
      t.string :bus_number
      t.boolean :status, default: true
      t.integer :user_id

      t.timestamps
    end
  end
end
