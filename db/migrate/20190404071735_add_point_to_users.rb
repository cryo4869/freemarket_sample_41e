class AddPointToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :point, :integer
    add_column :users, :icon_picture, :string
    add_column :users, :profile, :string
    add_column :users, :background_image, :string
    add_column :users, :telephone, :integer, unique: true
  end
end
