class AddSubjectToQuestionCes < ActiveRecord::Migration[5.1]
  def change
    add_column :question_ces, :subject_id, :int
  end
end
