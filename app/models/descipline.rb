class Descipline < ApplicationRecord
has_many :ebooks, dependent: :destroy
validates :name, presence: true
end
