class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.references :section, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :father
      t.string :mother
      t.text :address
      t.integer :pnumber
      t.integer :prevgrade, null: false

      t.timestamps
    end
  end
end
