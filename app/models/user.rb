class User < ApplicationRecord
    has_secure_password
    has_many :tests

    belongs_to :company, optional: true
    belongs_to :lab, optional: true
    
    validates :first_name, :last_name, :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 


    scope :is_customer, -> {where(is_customer: true)}
    scope :belong_to_company, -> {where(belongs_to_company: true)}
    scope :of_current_company, -> (company) {where("company_id = ?", company)}



    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.is_customer = true
            u.password = SecureRandom.hex(16)
        end
    end

    def self.create_from_omniauth_lab(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            lab = Lab.new(name: SecureRandom.hex(5))
            lab.users << u
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.belongs_to_lab = true
            u.lab_super_admin = true
            u.password = SecureRandom.hex(16)
        end
    end
    def self.create_from_omniauth_company(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            company = Company.new(name: SecureRandom.hex(5))
            company.users << u
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.belongs_to_company = true
            u.super_admin = true
            u.password = SecureRandom.hex(16)
        end
    end

end
