class RmCorumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :title, :content
  end
end
