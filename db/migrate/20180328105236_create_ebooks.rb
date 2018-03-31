class CreateEbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :ebooks do |t|
      t.string :name
      t.string :attachment
      t.string :discipline

      t.timestamps
    end
  end
end
