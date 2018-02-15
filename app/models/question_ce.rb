class QuestionCe < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :answers , dependent: :destroy 
  acts_as_votable
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 600 }
end
