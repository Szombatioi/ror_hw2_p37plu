class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :record

  validates :text, presence: true, length: { minimum: 1 }
end
