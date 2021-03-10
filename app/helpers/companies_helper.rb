module CompaniesHelper
    def company_admin?
        !!current_user.belongs_to_company
    end

    def is_add_admin_page
        params[:controller] == "admin/users" && params[:action] == "new"
    end
end
