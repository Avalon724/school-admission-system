class ChangeGradeFieldInEligibles < ActiveRecord::Migration[6.1]
  def up
    change_column :eligibles, :grade, :float
  end

  def down
    change_column :eligibles, :grade, :integer
  end
end
