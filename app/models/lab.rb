class Lab < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :company_lab_connections
    has_many :companies, through: :company_lab_connections



    def accepted_company_connections(current_lab)
        connections = current_lab.company_lab_connections.where(accepted: true)
        Company.find(
            connections.map do |connection|
                connection.company_id
            end
        )
    end

    def all_tests_through_company_connections(current_lab)
        current_lab.accepted_company_connections(current_lab).flat_map do |company| 
            Test.belonging_to_current_company(company)
        end
    end
end
