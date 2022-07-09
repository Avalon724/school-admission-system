class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.boolean :value, default: "false"

      t.timestamps
    end
  end
end
