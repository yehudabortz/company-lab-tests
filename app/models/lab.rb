class Lab < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :company_lab_connections
    has_many :companies, through: :company_lab_connections
end
