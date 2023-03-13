class CreateEmployeeDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_details do |t|
      t.string :first_name
      t.string :last_name,null: false
      t.string :phone_number,null: false
      t.string :designation,null: false
      t.references :employee,foreign_key: true
      t.timestamps
    end
  end
end
