class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
<<<<<<< HEAD
      t.references :user,null: false,foreign_key: true
      t.string :role,null: false,default: "user"
=======
      t.references :user, null: false, foreign_key: true
      t.string :role, default: "user", null: false
>>>>>>> dev
      t.timestamps
    end
  end
end
