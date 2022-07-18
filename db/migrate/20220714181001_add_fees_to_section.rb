class AddFeesToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :fees, :float
    change_column :students, :prevgrade, :float
  end
end
