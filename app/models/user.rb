class User < ApplicationRecord
    has_secure_password
    has_many :tests

    belongs_to :company, optional: true
    belongs_to :lab, optional: true
end
