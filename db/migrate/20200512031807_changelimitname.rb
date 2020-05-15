class Changelimitname < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :limit, :task_limit
  end
end
