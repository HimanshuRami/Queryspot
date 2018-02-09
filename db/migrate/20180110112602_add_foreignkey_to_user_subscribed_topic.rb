class AddForeignkeyToUserSubscribedTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :user_subscribed_topics, :user_id, :string
    add_column :user_subscribed_topics, :topic_id, :string
  end
end
