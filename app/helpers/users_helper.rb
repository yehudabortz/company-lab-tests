module UsersHelper
    def customer_has_provided_all_info
        current_user.first_name != nil && current_user.last_name != nil && current_user.email != nil && current_user.birthdate != nil && current_user.gender!= nil && current_user.phone != nil
    end
end
