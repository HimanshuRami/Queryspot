class CreateQuestionCes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_ces do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
	add_index :question_ces, [:user_id, :created_at]  
  end
end
