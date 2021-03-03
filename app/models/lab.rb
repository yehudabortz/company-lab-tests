class Lab < ApplicationRecord
    has_many :admins
    has_many :tests
    has_many :companies, through: :tests
end
