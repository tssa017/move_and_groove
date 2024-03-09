class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :weight, :integer
  end
end
