class Record < ApplicationRecord
  belongs_to :land

  has_many :comments, dependent: :destroy
  validates :title, presence: true
end
