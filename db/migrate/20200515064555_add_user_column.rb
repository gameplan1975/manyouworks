class AddUserColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true
    add_column :users, :password_digest, :string, null:false
    add_column :users, :email, :string, null:false
  end
end
