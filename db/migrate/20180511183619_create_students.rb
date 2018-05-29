class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :roll_number
      t.string :batch_number
      t.string :semester
      t.string :department
      t.boolean :approve, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :students, :user_id
  end
end
