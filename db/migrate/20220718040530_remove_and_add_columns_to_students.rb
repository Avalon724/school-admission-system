class RemoveAndAddColumnsToStudents < ActiveRecord::Migration[6.1]
  def up
    remove_column :students, :approved
    remove_column :students, :selected

    add_column :students, :status, :integer, default: 0
  end

  def down
    add_column :students, :approved, :boolean, default: false
    add_column :students, :selected, :boolean, default: false

    remove_column :students, :status, :integer, default: 0
  end
end
