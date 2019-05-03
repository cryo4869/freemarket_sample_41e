class ChangeBirthYearOptionsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column(:users, :birth_year, :integer, null: false)
  end
end
