class AddSellStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :sell_status, foreign_key: true
  end
end
