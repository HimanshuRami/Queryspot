class RemoveUseridFromSubject < ActiveRecord::Migration[5.1]
  def change
  remove_column :subjects, :user_id
  end
end
