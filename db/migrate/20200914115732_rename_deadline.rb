class RenameDeadline < ActiveRecord::Migration[6.0]
  def change
    rename_column :bills, :deadline, :due_date
  end
end
