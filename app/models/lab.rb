class Lab < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :company_lab_connections
    has_many :companies, through: :company_lab_connections


    def self.accepted_company_connections(current_lab)
        connections = current_lab.company_lab_connections.where(accepted: true)
        Company.find(
            connections.map do |connection|
                connection.company_id
            end
        )
    end
end
