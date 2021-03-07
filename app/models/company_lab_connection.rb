class CompanyLabConnection < ApplicationRecord
    belongs_to :company 
    belongs_to :lab, optional: true
end
