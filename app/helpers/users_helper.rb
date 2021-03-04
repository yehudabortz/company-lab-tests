module UsersHelper
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    # def customer?
    #     current_user.is_customer?
    # end

    # def super_admin?
    #     current_user.super_admin?
    # end

    # def company_admin?
    #     current_user.belongs_to_company?
    # end

    # def lab_admin?
    #     current_user.belongs_to_lab?
    # end

    # def can_edit?
    #     current_user.can_edit?
    # end
end
