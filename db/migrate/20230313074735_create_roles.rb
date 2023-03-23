class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :role, default: "user", null: false
      t.timestamps
    end
  end
end
