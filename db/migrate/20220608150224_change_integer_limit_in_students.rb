class ChangeIntegerLimitInStudents < ActiveRecord::Migration[6.1]
  def change
    change_column :students, :pnumber, :integer, limit: 8
  end
end
