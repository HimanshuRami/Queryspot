class RemoveQuestionCeidFromSubject < ActiveRecord::Migration[5.1]
  def change
  	  remove_column :subjects, :question_ce_id
  end
end
