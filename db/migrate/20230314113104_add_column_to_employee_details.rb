class AddColumnToEmployeeDetails < ActiveRecord::Migration[7.0]
  def change
		add_column :employee_details, :date_of_birth, :date, null: false
  end
end
