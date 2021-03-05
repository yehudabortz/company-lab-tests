class Test < ApplicationRecord
    belongs_to :company
    belongs_to :lab, optional: true
    belongs_to :user, optional: true
    accepts_nested_attributes_for :user

    validates :unique_test_id, uniqueness: true

    scope :belonging_to_current_company, -> (company) {where("company_id = ?", company)}
    scope :belonging_to_user, -> (user) {where("user_id = ?", user)}

    def self.generate_unique_test_id
        SecureRandom.random_number(99999)
    end

    def calculate_result
        mma = self.mma
        creatinine = self.creatinine * 10
        result = mma / creatinine
        self.final_result = result.round(2)
    end
end
