class Company < ApplicationRecord
    has_many :admins
    has_many :tests
    has_many :labs, through: :tests
    has_many :users, through: :tests
end
