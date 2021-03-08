class Company < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :company_lab_connections
    has_many :labs, through: :company_lab_connections
    # has_many :users, through: :tests

    validates :name, uniqueness: { case_sensitive: false }

    def test_ids
        self.tests.ids
    end

    def current_company_lab_connections
        self.company_lab_connections.where(accepted: true)
    end


end
