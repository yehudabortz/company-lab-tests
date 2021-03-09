module UsersHelper

    def only_user_can_view
        redirect_to root_path, notice: "Restricted" unless logged_in? && current_user.id == params_id_integer
    end

    def user_can_view_user
        redirect_to root_path, notice: "Restricted" unless logged_in? && current_user.is_customer && current_user.id == params[:user_id].to_i || current_user.super_admin && current_user.company.company_customers(current_company).include?(User.find(params[:user_id] ))
    end

    def admin_can_view_user
        redirect_to root_path, notice: "Restricted" unless logged_in? && current_user.belongs_to_lab || current_user.belongs_to_lab && current_user.id == params_id_integer
    end

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
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin || current_user.belongs_to_company || current_user.lab_super_admin
    end

    def redirect_unless_company_super_admin?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin 
    end

    def redirect_unless_lab_super_admin?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.lab_super_admin
    end

    def is_admin?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin || current_user.lab_super_admin
    end

end
