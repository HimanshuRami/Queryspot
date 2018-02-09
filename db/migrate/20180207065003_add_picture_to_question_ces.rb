class AddPictureToQuestionCes < ActiveRecord::Migration[5.1]
  def change
    add_column :question_ces, :picture, :string
  end
end
