class CreateEligibles < ActiveRecord::Migration[6.1]
  def change
    create_table :eligibles do |t|
      t.integer :age
      t.integer :grade
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
