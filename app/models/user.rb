class User < ApplicationRecord
    has_secure_password
    has_many :tests

    belongs_to :company, optional: true
    belongs_to :lab, optional: true
    
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }




    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(16)
        end
    end
end
