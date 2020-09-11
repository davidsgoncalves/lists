class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :name, null: false
      t.decimal :value, precision: 8, scale: 2
      t.date :deadline

      t.timestamps
    end
  end
end
