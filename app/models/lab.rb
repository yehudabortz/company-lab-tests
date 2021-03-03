class Lab < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :companies, through: :tests
end
