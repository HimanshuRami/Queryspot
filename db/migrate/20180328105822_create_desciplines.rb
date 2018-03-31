class CreateDesciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :desciplines do |t|
      t.string :name

      t.timestamps
    end
  end
end
