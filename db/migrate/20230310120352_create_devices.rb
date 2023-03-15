class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :category, null: false
      t.string :tagNo, null: false, unique: true
      t.string :build, null: false
      t.boolean :status, null: false, default: false
      t.references :employee, foreign_key: true

      
      t.timestamps
    end
  end
end
