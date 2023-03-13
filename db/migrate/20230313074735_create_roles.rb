class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.references :employee,null: false,foreign_key: true
      t.string :role,null: false
      t.timestamps
    end
  end
end
