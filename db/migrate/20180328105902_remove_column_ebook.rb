class RemoveColumnEbook < ActiveRecord::Migration[5.1]
  def change
  remove_column :ebooks, :descipline
  end
end
