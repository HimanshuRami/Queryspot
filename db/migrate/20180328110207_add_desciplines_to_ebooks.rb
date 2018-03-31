class AddDesciplinesToEbooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :ebooks, :descipline, foreign_key: true
  end
end
