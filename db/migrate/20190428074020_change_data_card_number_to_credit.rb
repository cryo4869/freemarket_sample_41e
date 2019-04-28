class ChangeDataCardNumberToCredit < ActiveRecord::Migration[5.2]
  def change
    change_column :credits, :card_number, :string
  end
end
