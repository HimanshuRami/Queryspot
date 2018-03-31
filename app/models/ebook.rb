class Ebook < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :name, presence: true
    validates :attachment, presence: true
    validates :descipline, presence: true
    belongs_to :descipline
end
