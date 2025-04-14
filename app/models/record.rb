class Record < ApplicationRecord
  belongs_to :land

  has_many :comments, dependent: :destroy
end
