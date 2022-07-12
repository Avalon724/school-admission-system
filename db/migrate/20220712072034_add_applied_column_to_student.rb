class AddAppliedColumnToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :applied, :boolean, default: false
  end
end
