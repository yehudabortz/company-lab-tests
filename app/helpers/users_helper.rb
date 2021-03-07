module UsersHelper
    def customer_has_provided_all_info
        current_user.first_name != nil && current_user.last_name != nil && current_user.email != nil && current_user.birthdate != nil && current_user.gender!= nil && current_user.phone != nil
    end

    def is_customer?
        current_user.is_customer
    end

    def can_register_test?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && is_customer?
    end

    def can_access_test?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && is_customer? && current_user.company.test_ids.include?(params[:id])
    end

    def has_access_to_company_tests?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin || current_user.company.lab_super_admin
    end

    def is_company_super_admin?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin 
    end

    def has_lab_admin_permissions?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.lab_super_admin
    end


end
