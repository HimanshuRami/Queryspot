class Comment < ApplicationRecord
  belongs_to :micropost 
  belongs_to :user
  acts_as_votable
end
