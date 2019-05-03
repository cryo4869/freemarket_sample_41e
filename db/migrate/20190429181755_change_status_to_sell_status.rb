class ChangeStatusToSellStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :sell_statuses, :status, :string
  end
end
