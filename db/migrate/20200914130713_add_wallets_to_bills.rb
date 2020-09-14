class AddWalletsToBills < ActiveRecord::Migration[6.0]
  def change
    add_reference :bills, :wallet
  end
end
