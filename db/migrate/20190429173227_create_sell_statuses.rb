class CreateSellStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_statuses do |t|
      t.integer :status

      t.timestamps
    end
  end
end
