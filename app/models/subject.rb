class Subject < ApplicationRecord
  has_many :question_ces, dependent: :destroy
end
