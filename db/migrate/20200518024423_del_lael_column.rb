class DelLaelColumn < ActiveRecord::Migration[5.2]
  def down
    remove_column :tasks, :label, :string
  end
end
