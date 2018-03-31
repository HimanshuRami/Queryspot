class RemoveDisciplineFromEbooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :ebooks, :discipline, :string
  end
end
