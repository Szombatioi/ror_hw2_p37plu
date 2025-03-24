class Land < ApplicationRecord
    has_many :records, dependent: :destroy
end
