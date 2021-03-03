class Admin < ApplicationRecord
    has_secure_password
    
    belongs_to :company
    belongs_to :lab
end
