class AddImportantToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :important, :boolean
  end
end
