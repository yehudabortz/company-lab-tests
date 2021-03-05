module TestsHelper
    def link_to_test_show_page(test)
        if admin?
            link_to test.unique_test_id, admin_test_path(test)
        else
            link_to test.unique_test_id, user_test_path(current_user, test)
        end
    end
end
