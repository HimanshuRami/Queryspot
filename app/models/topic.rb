class Topic < ApplicationRecord

	has_many :user_subscribed_topics, inverse_of: :topic
	has_many :users, through: :user_subscribed_topics
end
