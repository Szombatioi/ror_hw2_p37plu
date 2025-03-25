class Land < ApplicationRecord
    has_many :records, dependent: :destroy
    validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Már létezik ilyen nevű tájegység." }
end
