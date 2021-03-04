class Company < ApplicationRecord
    has_many :users
    has_many :tests
    has_many :labs, through: :tests
    has_many :users, through: :tests

    accepts_nested_attributes_for :users


    def users_attributes=(users_attributes)
        users_attributes.values.each do |user_attribute|
            user = User.find_or_create_by(user_attribute)
            user.super_admin = true
            user.belongs_to_company = true
            self.users << user
        end
    end

end
