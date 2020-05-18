class ChangeLabel < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :content, :string
    rename_column :labels, :name, :title
  end
end
