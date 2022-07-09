class AddApprovedToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :approved, :boolean, default: false
    add_column :students, :selected, :boolean, default: false
  end
end
