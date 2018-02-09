class ChangeDatatypeToUserSubscribedTopics < ActiveRecord::Migration[5.1]
  def change
		change_column :user_subscribed_topics, :user_id, :integer
	    change_column :user_subscribed_topics, :topic_id, :integer
  end
end
