class WebflowWebhookController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webflow_webhook, :webhook_params]

    def webflow_webhook
        if webhook_params[:unique_test_id] 
            test = Test.find_by(unique_test_id: webhook_params[:unique_test_id].to_i)
            if test
                user = User.find_or_create_by(email: webhook_params[:email])
                unless user.password_digest != nil
                    user.password_digest = SecureRandom.hex(10)
                end
                user.tests << test
                user.save
                user.update(user_params)
            end 
            render json: user
        end
    end
    
    private
    
    def webhook_params
        params.require(:data).permit(:unique_test_id, :first_name, :last_name, :birthdate, :gender, :email, :phone_number, :dr_email)
    end

    def user_params 
        webhook_params.except("unique_test_id")
    end

end
