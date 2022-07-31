class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.references :student, null: false, foreign_key: true
      t.datetime :schedule
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
