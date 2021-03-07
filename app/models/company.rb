class Company < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :company_lab_connections
    has_many :labs, through: :company_lab_connections

    validates :name, uniqueness: { case_sensitive: false }

    def test_ids
        self.tests.ids
    end

end
