class CreateEmployeeDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_details do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.bigint :phone_number, null: false, unique: true
      t.string :designation, null: false
      t.date :date_of_birth, null: false
      t.references :employee, foreign_key: true, null: false
      t.timestamps
    end
  end
end
