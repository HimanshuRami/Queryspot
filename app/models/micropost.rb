class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 560 }
  validate :picture_size
end

private 

#validates the size of an upload picture
def picture_size
	if picture.size > 5.megabytes
		errors.add(:picture, "Should be less than 5 MB")
	end
end
