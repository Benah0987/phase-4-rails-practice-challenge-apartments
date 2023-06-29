class Apartment < ApplicationRecord
    has_many :leases
    has_many :tenant
    validates :number, presence: true
end
