module SessionsHelper
    def google_oauth_state_control(state = "")
        "#{auth_google_oauth2_path}?user=#{state}"
    end
end
