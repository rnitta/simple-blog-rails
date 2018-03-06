class ChangeUrlColumnToName2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :url, :name
  end
end
