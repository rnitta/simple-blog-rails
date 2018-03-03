class ChangeUrlColumnToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :blogs, :url, :name
  end
end
