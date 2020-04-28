class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
