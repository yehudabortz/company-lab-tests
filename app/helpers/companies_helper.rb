module CompaniesHelper
    def company_admin?
        current_user.belongs_to_company
    end
end
