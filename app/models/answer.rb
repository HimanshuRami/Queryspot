class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question_ce
  acts_as_votable
  mount_uploader :picture, PictureUploader
end
