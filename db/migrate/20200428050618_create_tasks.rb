class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.string :label
      t.date :limit
      t.string :title

      t.timestamps
    end
  end
end
