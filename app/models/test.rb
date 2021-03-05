class Test < ApplicationRecord
    belongs_to :company
    belongs_to :lab, optional: true
    belongs_to :user, optional: true

    validates :unique_test_id, uniqueness: true

    def self.generate_unique_test_id
        SecureRandom.random_number(99999)
    end
end
