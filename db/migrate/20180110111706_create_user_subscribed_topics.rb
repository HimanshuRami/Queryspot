class CreateUserSubscribedTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :user_subscribed_topics do |t|
    	
    	add_reference :users , :topics , foreign_key: true
      t.timestamps
    end
  end
end
