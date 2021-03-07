class CompanyLabConnection < ApplicationRecord
    belongs_to :company 
    belongs_to :lab, optional: true


    scope :pending_company_lab_connections, -> {where("pending = true")}
end
